sed -i '/<configuration>/a \
<property>\
        <name>hadoop.tmp.dir</name>\
        <value>/root/hadoop/tmp</value>\
        <description>Abase for other temporary directories.</description>\
</property>\
<property>\
        <name>fs.default.name</name>\
        <value>hdfs://hserver1:9000</value>\
</property>' sedmutipleline
