#### Correction Exercice 1 disk

1. Tâche 1

- Récupérer UUID d'un disque 

```bash
sudo blkid
```

- Formater le disque

```bash
sudo mkfs.ext4 <disque>
```

- Modifier fstab

```
UUID=<UUID> /mnt/sdb ext4 defaults,noatime,nodiratime 0 2
```

2. Tâche 2

- Modifier fstab

```
UUID=<UUID> /mnt/sdb ext4 ro 0 2
```

3. Tâche 3

- Modifier fstab

```
tmpfs /mnt/tmp tmpfs defaults,size=1G 0 0
```


4. Tâche 4

- Installer quota

```bash
apt install quota
```

- Montage dans fstab avec usrquota

```
UUID=<UUID> /mnt/sdb ext4 defautls,usrquota 0 2
```

- Activer les quota sur un point de montage
```bash
quotaon /mnt/sdb
edquota <nom_utilisateur>
```