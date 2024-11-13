```bash
mkdir -p logs_archive/{app1_logs,app2_logs, app3_logs}
for i in {1..5}; do 
    touch logs_archive/app1_logs/log$i.txt
    echo "Log data for app1" > logs_archive/app1_logs/log$i.txt
    touch logs_archive/app2_logs/log$i.txt
    echo "Log data for app2" > logs_archive/app2_logs/log$i.txt
    touch logs_archive/app3_logs/log$i.txt
    echo "Log data for app3" > logs_archive/app3_logs/log$i.
done

gzip logs_archive/app1_logs/*.txt
bzip2 logs_archive/app2_logs/*.txt
lzma logs_archive/app3_logs/*.txt

tar -cvf logs_archive/all_logs.tar logs_archive/app1_logs logs_archive/app2_logs logs_archive/app3_logs

tar -tvf logs_archive/all_logs.tar

tar -czvf logs_archive/all_logs.tar.gz logs_archive/app1_logs logs_archive/app2_logs logs_archive/app3_logs

tar -cjvf logs_archive/all_logs.tar.bz2 logs_archive/app1_logs logs_archive/app2_logs logs_archive/app3_logs

tar --lzma -cvf logss_archive/all_logs.tar.lzma logs_archive/app1_logs log_archive/app2_logs logs_archive/app3_logs

mkdir extracted_logs

tar -xvf logs_archive/all_logs.tar -C extracted_logs

tar -xzvf logs_archive/all_logs.tar.gz -C extracted_logs

tar -xjvf logs_archive/all_logs.tar.bz2 -C extracted_logs

tar --lzma -xvf logs_archive/all_logs.tar.lzma -C extracted_logs

```


```bash
#!/bin/bash
LOG_DIR="logs_archive"
BACKUP_DIR="backup"
DATE=$(date +%F)
ARCHIVE_NAME="backup_logs_$DATE_tar.gz"
mkdir -p $BACKUP_DIR

tar -cvzf $BACKUP_DIR/$ARCHIVE_NAME $LOG_DIR/app1_logs $LOG_DIR/app2_logs $LOG_DIR/app3_logs

echo "Backup terminé : $BACKUP_DIR/$ARCHIVE_NAME"

```

```
du -h logs_archive/*.tar*
```