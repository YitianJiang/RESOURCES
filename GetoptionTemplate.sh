#!/bin/bash
 
#定义选项， -o 表示短选项 -a 表示支持长选项的简单模式(以 - 开头) -l 表示长选项 
# a 后没有冒号，表示没有参数
# b 后跟一个冒号，表示有一个必要参数
# c 后跟两个冒号，表示有一个可选参数(可选参数必须紧贴选项)
# -n 出错时的信息
# -- 也是一个选项，比如 要创建一个名字为 -f 的目录，会使用 mkdir -- -f ,
#    在这里用做表示最后一个选项(用以判定 while 的结束)
# $@ 从命令行取出参数列表(不能用用 $* 代替，因为 $* 将所有的参数解释成一个字符串
#                         而 $@ 是一个参数数组)

version=3.4.9
confDir=/root/zookeeper-${version}/conf
dataDir=/root/zookeeper-${version}/data
logDir=/root/zookeeper-${version}/logs
TEMP=`getopt -o v:c:d:l: -a -l version:,confDir:,dataDir:,logDir: -n "ERROR" -- "$@"`
 
# 判定 getopt 的执行时候有错，错误信息输出到 STDERR
if [ $? != 0 ]
then
	echo "Terminating....." >&2
	exit 1
fi
 
# 重新排列参数的顺序
# 使用eval 的目的是为了防止参数中有shell命令，被错误的扩展。
eval set -- "$TEMP"
echo $@ 
# 处理具体的选项
while true
do
	case "$1" in
                -v | --version | -version) version=$2
                        echo "option v, argument $2"
                        shift 2
                        ;;
                -c | --confDir | -confDir) confDir=$2
                        echo "option c, argument $2"
                        shift 2
                        ;;
                -d | --dataDir | -dataDir) dataDir=$2
                        echo "option d, argument $2"
                        shift 2
                        ;;
		-l | --logDir | -logDir) logDir=$2
			echo "option l, argument $2"
			shift 2
			;;
		--)
			shift
			break
			;;
		*) 
			echo "Internal error!"
			exit 1
			;;
		esac
 
done
echo $version
echo $confDir
echo $dataDir
echo $logDir
#显示除选项外的参数(不包含选项的参数都会排到最后)
# arg 是 getopt 内置的变量 , 里面的值，就是处理过之后的 $@(命令行传入的参数)
for arg do
   echo '--> '"$arg" ;
done
