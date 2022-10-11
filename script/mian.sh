#!/bin/sh

# 下载规则
curl -o i-1.txt https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt
curl -o i-2.txt https://code.gitlink.org.cn/damengzhu/filelink/raw/branch/master/360%e6%8b%a6%e6%88%aa%e8%a7%84%e5%88%99.txt
curl -o i-3.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad3.txt
curl -o i-4.txt https://filters.adtidy.org/android/filters/224_optimized.txt

# 合并规则并去除重复项
cat i*.txt > i-mergd.txt
cat i-mergd.txt | grep -v '^!' | grep -v '^！' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > i-tmpp.txt
sort -n i-tmpp.txt | uniq > i-tmp.txt


# 计算规则数
num=`cat i-tmp.txt | wc -l`

# 添加标题和时间
echo "[Adblock Plus 2.0]" >> i-tpdate.txt
echo "! Title: abpmerge Rules" >> i-tpdate.txt
echo "! Description: 该规则合并自AdFilters，360，jiekouAD，AdGuard国内规则" >> i-tpdate.txt
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> i-tpdate.txt
echo "! Total count: $num" >> i-tpdate.txt
cat i-tpdate.txt i-tmp.txt > abpmerge.txt

# 删除缓存
rm i-*.txt

#退出程序
exit
