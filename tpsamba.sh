#!/bin/bash

group_list=("prof" "ciel1" "ciel2" "admin")
user_list=("zeus" "ava" "axel" "barbara" "bertrand" "dartois" "dauriac")

for group in "${group_list[@]}"; do
  if getent group "$group" > /dev/null 2>&1; then
    echo "Le groupe '$group' existe déjà."
  else
    groupadd "$group"
    if [ $? -eq 0 ]; then
      echo "Le groupe '$group' a été créé avec succès."
      group_dir="/home/$group"
      if [ -d "$group_dir" ]; then
        echo "Le dossier '$group_dir' existe."
      else
        echo "Création du dossier '$group_dir'..."
        mkdir "$group_dir" && echo "Dossier '$group_dir' créé." || echo "Erreur lors de la création du dossier '$group_dir'."
      fi
    else
      echo "Erreur lors de la création du groupe '$group'."
    fi
  fi
done

mkdir /home/admin/rep_zeus
mkdir /home/ciel1/rep_ava
chmod /home/ciel1 -R 447
mkdir /home/ciel1/rep_axel
mkdir /home/ciel2/rep_barbara
mkdir /home/ciel2/rep_bertrand
mkdir /home/prof/rep_dartois
mkdir /home/prof/rep_dauriac

#zeus
user_name="${user_list[0]}"
user_home="/home/admin/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g admin -G prof,ciel1,ciel2 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":admin "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi

#ava
user_name="${user_list[1]}"
user_home="/home/ciel1/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g ciel1 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":ciel1 "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi

#axel
user_name="${user_list[2]}"
user_home="/home/ciel1/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g ciel1 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":ciel1 "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi

#barbara
user_name="${user_list[3]}"
user_home="/home/ciel2/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g ciel2 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":ciel2 "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi

#bertrand
user_name="${user_list[4]}"
user_home="/home/ciel2/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g ciel2 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":ciel2 "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi

#dartois
user_name="${user_list[5]}"
user_home="/home/prof/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g prof -G ciel1,ciel2 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":prof "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi

#dauriac
user_name="${user_list[6]}"
user_home="/home/prof/rep_$user_name"
  if id "$user_name" > /dev/null 2>&1; then
    echo "L'utilisateur '$user_name' existe déjà, moi romain le dieu je vais modifier ses attributs."
  else
    useradd -m -d "$user_home" -g prof -G ciel1,ciel2 "$user_name" && echo "Romain le dieu a créé l'utilisateur '$user_name'."
    if [ -d "$user_home" ]; then
      chown -R "$user_name":prof "$user_home"
      echo "Le dossier '$user_home' a été assigné à l'utilisateur '$user_name'."
    else
      echo "Erreur : le dossier '$user_home' n'existe pas."
    fi
  fi
  
exit 0
