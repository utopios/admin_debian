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
