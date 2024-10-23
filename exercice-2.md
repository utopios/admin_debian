### Exercice : Gestion des Partitions 

#### Objectif :
Dans cet exercice, vous allez créer et gérer des partitions sur un disque en utilisant les formats **MBR** et **GPT**, sans utiliser LVM. Vous allez apprendre à manipuler les partitions à l'aide des outils **fdisk** pour MBR et **parted** pour GPT.


### Étapes de l'exercice

#### Partie 1 : Gestion des Partitions MBR avec `fdisk`

1. **Lister les disques disponibles** :
   - Utilisez la commande **`lsblk`** pour afficher la liste des disques et partitions disponibles.
   - Identifiez le disque supplémentaire ajouté (par exemple, **/dev/sdb**).

2. **Créer une table de partitions MBR** :
   - Utilisez **`fdisk`** pour créer une table de partitions MBR sur le disque **/dev/sdb**.
   - Effacez toutes les partitions existantes sur le disque si nécessaire, puis créez une table de partitions de type **MBR**.

3. **Créer une partition primaire** :
   - Utilisez **`fdisk`** pour créer une partition primaire de 5 Go sur **/dev/sdb**.
   - Sauvegardez et appliquez les changements.

4. **Formater la partition** :
   - Formatez la partition nouvellement créée en **ext4**.

5. **Monter la partition** :
   - Créez un répertoire de montage, par exemple **/mnt/partition_mbr**, et montez la partition créée dans ce répertoire.
   - Vérifiez que le montage est correct à l’aide de la commande **`df -h`**.

#### Partie 2 : Gestion des Partitions GPT avec `parted`

1. **Créer une table de partitions GPT** :
   - Utilisez **`parted`** pour créer une table de partitions **GPT** sur le même disque **/dev/sdb**. Cela effacera les partitions précédentes.
   
2. **Créer une nouvelle partition** :
   - Avec **`parted`**, créez une partition de 8 Go en utilisant le format **GPT** sur le disque **/dev/sdb**.
   - Utilisez le système de fichiers **ext4**.

3. **Formater et monter la partition** :
   - Formatez la partition nouvellement créée en **ext4**.
   - Montez cette partition dans un autre répertoire, par exemple **/mnt/partition_gpt**, et vérifiez avec **`df -h`**.

#### Partie 3 : Montage automatique des partitions

1. **Configurer le montage permanent avec `/etc/fstab`** :
   - Ajoutez les partitions créées dans **/etc/fstab** pour qu’elles se montent automatiquement au démarrage.
   - Utilisez les UUID des partitions pour les référencer dans **/etc/fstab**.

2. **Vérifications finales** :
   - Redémarrez la machine et vérifiez que les partitions sont montées automatiquement avec **`df -h`**.
