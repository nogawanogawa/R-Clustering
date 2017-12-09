#事前作業：
#対象URLからexcelファイルをダウンロードして、csvファイルに書き出す
car = read.csv("ここにcsvファイルのファイルパスを入力",header=TRUE)
  
car3 = car[1:6,c(-1,-2)]
head(car3)

dist = dist(car3)
dist

#クラスタリングを実施
single=hclust(dist,"single")

#併合過程を表示
single$merge
plot(single,main ="Clustering",xlab = "メーカ名")

#各計算方法によるマージ過程
sngl=hclust(dist,"single")
comp=hclust(dist) 
aver=hclust(dist,"average")
ward=hclust(dist,"ward.D2")
cntr=hclust(dist,"centroid")
medi=hclust(dist,"median")

label.d=c("単連結法","単連結法","完全連結法","完全連結法","群平均法","群平均法","ウォード法","ウォード法","重心法","重心法","メディアン法","メディアン法")
merge.d=data.frame(sngl$merge,comp$merge,aver$merge,ward$merge,cntr$merge,medi$merge)
names(merge.d)=label.d
merge.d

par(mfrow=c(2,3));
plot(sngl, main="単連結法"); 
plot(comp, main="完全連結法"); 
plot(aver, main="群平均法") ;　
plot(ward, main="ウォード法"); 
plot(cntr, main="重心法"); 
plot(medi, main="メディアン法")
