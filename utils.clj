(ns a17-classifier.utils
  (:use [clojure.data.json :only (read-json)]
        [clojure.java.io :only (reader)])
  (:import (org.apache.lucene.analysis Analyzer PorterStemFilter)
           (org.apache.lucene.analysis.standard StandardAnalyzer)
           (org.apache.lucene.util Version)
           (org.apache.lucene.analysis.de GermanAnalyzer GermanStemFilter)
           (org.apache.lucene.analysis.fr FrenchAnalyzer)
           (org.apache.lucene.analysis.es SpanishAnalyzer)
           (org.apache.lucene.analysis.snowball SnowballFilter)
           (org.apache.lucene.analysis.tokenattributes CharTermAttribute)
           (org.tartarus.snowball.ext FrenchStemmer, SpanishStemmer)
           (java.io StringReader ByteArrayInputStream)
           (java.util HashSet)
           (java.util.zip InflaterInputStream)
           (sun.misc BASE64Decoder)))

(defn load-config [file-name]
  (read-json (slurp file-name)))

(defn load-stopwords [file-name]
  (let [stopwords (HashSet.)]
    (doseq [word (line-seq (reader file-name))] (.add stopwords word)) stopwords))

;; refactor the analyzers creation, too many similarities
(defn- create-english-analyzer [stopwords-file-name stemmed]
  (let [stopwords (load-stopwords stopwords-file-name)]
    (if stemmed
      (proxy [Analyzer] []
        (tokenStream [field-name reader]
          (PorterStemFilter. (.tokenStream (StandardAnalyzer. Version/LUCENE_34 stopwords)
                                           field-name
                                           reader))))
      (StandardAnalyzer. Version/LUCENE_34 stopwords))))

(defn- create-german-analyzer [stopwords-file-name stemmed]
  (let [stopwords (reader stopwords-file-name)]
    (if stemmed
      (proxy [Analyzer] []
        (tokenStream [field-name reader]
          (GermanStemFilter. (.tokenStream (GermanAnalyzer. Version/LUCENE_34 stopwords)
                                           field-name
                                           reader))))
      (GermanAnalyzer. Version/LUCENE_34 stopwords))))

(defn- create-french-analyzer [stopwords-file-name stemmed]
  (let [stopwords (reader stopwords-file-name)]
    (if stemmed
      (proxy [Analyzer] []
        (tokenStream [field-name reader]
          (SnowballFilter. (.tokenStream (FrenchAnalyzer. Version/LUCENE_34 stopwords)
                                         field-name
                                         reader)
                           (FrenchStemmer.))))
      (FrenchAnalyzer. Version/LUCENE_34 stopwords))))

(defn- create-spanish-analyzer [stopwords-file-name stemmed]
  (let [stopwords (reader stopwords-file-name)]
    (if stemmed
      (proxy [Analyzer] []
        (tokenStream [field-name reader]
          (SnowballFilter. (.tokenStream (SpanishAnalyzer. Version/LUCENE_34 stopwords)
                                         field-name
                                         reader)
                           (SpanishAnalyzer. Version/LUCENE_34 stopwords))))
      (SpanishAnalyzer. Version/LUCENE_34 stopwords))))


(defmacro create-analyzer-with-stopwords-set [language stopwords-set stemmed]
;TODO: throw an exception when language not supported 
   (let [filter-prefix-map {:French 'Snowball :English 'Standard } 
         Analyzer* (symbol (str (name language) "Analyzer."))
         Filter* (symbol (str (language filter-prefix-map (name language)) "Filter."))
         stemmer-map {:French '(FrenchStemmer.)}
         Stemmer* (language stemmer-map "")
         ]
    `(if ~stemmed
      (proxy [Analyzer] []
        (tokenStream [field-name# reader#]
          (~Filter* (.tokenStream (~Analyzer* Version/LUCENE_34 ~stopwords-set)
                                           field-name#
                                           reader#)
                     ~Stemmer*)))
      (~Analyzer* Version/LUCENE_34 stopwords#))))

(defn create-analyzer [language stopwords-file-name stemmed]
    (create-analyzer-with-stopwords-set language (reader stopwords-file-name) stemmed))


(defn stem-text [text stemming-analyzer]
  (let [iter (fn [ts cta acc]
               (if (.incrementToken ts) (recur ts cta (conj acc (.toString cta))) acc))
        ts (.tokenStream stemming-analyzer "dummy" (StringReader. text))]
    (iter ts (.getAttribute ts CharTermAttribute) '())))

(defn inflate-text [text]
  (slurp
   (InflaterInputStream. (ByteArrayInputStream. (.decodeBuffer (BASE64Decoder.) text)))))
