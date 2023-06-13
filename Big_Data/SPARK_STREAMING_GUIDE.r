#1 Import Classes
sparkR.session(appName = "StructuredNetworkWordCount")

#2 Create Dataframe
# Create DataFrame representing the stream of input lines from connection to localhost:9999
lines <- read.stream("socket", host = "localhost", port = 9999)

# Split the lines into words
words <- selectExpr(lines, "explode(split(value, ' ')) as word")

# Generate running word count
wordCounts <- count(group_by(words, "word"))

#3 Set up Query
# Start running the query that prints the running counts to the console
query <- write.stream(wordCounts, "console", outputMode = "complete")

awaitTermination(query)

"""
To actually execute this example code, you can either compile the code in your own Spark application, or simply run the example once you have downloaded Spark. We are showing the latter. You will first need to run Netcat (a small utility found in most Unix-like systems) as a data server by using

$ nc -lk 9999
"""

#4 Start in different Terminal
$ ./bin/spark-submit examples/src/main/r/streaming/structured_network_wordcount.R localhost 9999

#5 Output on Screen
-------------------------------------------
Batch: 0
-------------------------------------------
+------+-----+
| value|count|
+------+-----+
|apache|    1|
| spark|    1|
+------+-----+

-------------------------------------------
Batch: 1
-------------------------------------------
+------+-----+
| value|count|
+------+-----+
|apache|    2|
| spark|    1|
|hadoop|    1|
+------+-----+
...

### Recovering Failures with Checkpointing ####

write.stream(aggDF, "memory", outputMode = "complete", checkpointLocation = "path/to/HDFS/dir")
