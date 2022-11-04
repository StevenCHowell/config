rename 's/201708/2017-08-/g' *
rename 's/201709/2017-09-/g' *
rename 's/201710/2017-12-/g' *
rename 's/201711/2017-12-/g' *
rename 's/201712/2017-12-/g' *
rename 's/201801/2018-01-/g' *
rename 's/201802/2018-02-/g' *

for file in *_[0-9][0-9][0-9][0-9][0-9][0-9]* ; do
mv ./"$file" "${file:0:15}.${file:15}"
done

for file in *_[0-9][0-9][0-9][0-9].[0-9][0-9]* ; do
mv ./"$file" "${file:0:13}.${file:13}"
done

rename 's/_/ /g' *
