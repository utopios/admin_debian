### Correction TP 3

1. Après l'ajout du disque dans virtualBox, on peut vérifier le nouveau disque
```bash
lsblk
```

2. Création d'un volume physique
```bash
# Création
sudo pvcreate /dev/sdd

# Vérification
sudo pvdisplay
```

3. Création d'un groupe de volumes physique.

```bash
# Création
sudo vgcreate vg_tp /dev/sdd 

# Vérification
sudo vgdisplay 
```

4. Création d'un volume logique
```bash
# Création
sudo lvcreate -L 5G -n lv_tp vg_tp

# Vérification
sudo lvdisplay
```

5. Formattage avec du ext4
```bash
# Formater
sudo mkfs.ext4 /dev/vg_tp/lv_tp

# Vérification
sudo blkid /dev/vg_tp/lv_tp
```

6. Montage du disque
```bash
# monter
sudo mkdir /mnt/lv_tp
sudo mount /dev/vg_tp/lv_tp /mnt/lv_tp

# Vérification
df -h
```

7. Montage avec systemd
    - Créer une unité de montage dans systemd
    ```bash
    sudo nano /etc/systemd/system/mnt-tp.mount
    ```

    - Contenu du fichier
    ```config
    [Unit]
    Description=Mount TP LVM

    [Mount]
    What=/dev/vg_tp/lv_tp
    Where=/mnt/lv_tp
    Type=ext4
    Options=defaults

    [Install]
    WantedBy=multi-user.target
    ```

8. Montage par systemd

```bash
sudo systemctl daemon-reload
sudo systemctl enable mnt-lv.mount
sudo systemctl start mnt-lv.mount

df -h
```