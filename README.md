# Oxalide Workshop #2

## Contenu

 * ESI/Ajax, du dynamique dans du statique
 * Vmods principaux et leur utilite
 * Cache hierarchique
 * Partage de cache entre plusieurs Varnish

## Notes

 * Le user vagrant a tous les droits via sudo

## AJAX - Solution
On fait un simple appel AJAX vers un script qui n'est pas mis en cache et qui renvoie l'information dont on a besoin.
Voir :
 * index-ajax.php
 * ajax.php

## ESI - Solution
On remplace la valeur dont on a besoin par un appel ESI. Attention a la gestion des sessions.
 * "set beresp.do\_esi = true;" dans sub "vcl\_backend\_response"
 * Initialisation de la session PHP si besoin via un appel AJAX (index-esi.php et init-session.php)
 * Bloc ESI dans le HTML (index-esi.php et esi.php) ; Varnish va faire un appel vers l'URL indiquee pour remplacer ce bloc:

    ''<esi:include src='/esi.php'/>''
