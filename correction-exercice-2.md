### Correction Exercice 2


##### Partie 1

1. Lister les disques
```bash
lsblk
```

2. Créer une partition MBR sur /dev/sdb
```bash
sudo fdisk /dev/sdb
### Dans fdisk
## n => créer une nouvelle partition
## p => primaire
## +5G => pour une partition de 5GO
## w
```

2. Formater la partition

```bash
sudo mkfs.ext4 /dev/sdb1
```

3. Monter la partition

```bash
sudo mkdir /mnt/partition_mbr
sudo mount /dev/sdb1 /mnt/partition_mbr
df -h
```

---

##### Partie 2

1. Créer une table de partition GPT sur /dev/sdb

```bash
sudo parted /dev/sdb
## Dans parted
# mklabel gpt (créer une table GPT)
```

2. Créer une partition GPT de 8Go

```bash
## Dans parted
# mkpart primary ext4 1Mib 8000Mib
```

3. Formater la partition en ext4
```bash
sudo mkfs.ext4 /dev/sdb1
```

4. Monter la partition

```bash
sudo mkdir /mnt/partition_gpt
sudo mount /dev/sdb1 /mnt/partition_gpt
df -h
```

##### Partie 3

1. Obtenir UUID de la partition

```bash
sudo blkid /dev/sdb1
```

2. Ajouter les partitions dans fstab
```bash
sudo nano /etc/fstab
### Ajouter 
#UUID=xxxxxxxxxxxx /mnt/partition_gpt ext4 defaults 0 2
```

3. Monter les partitions d'une façon automatique
```bash
sudo mount -a
df -h
```

