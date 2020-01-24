# arp_npl_ili2pg4.3.1
Create Schema und Import Daten der Nutzungsplanung mit ili2pg V 4.3.1

Git clonen:
```
  git clone https://github.com/bjsvwcur/arp_npl_ili2pg4.3.1.git
```

Docker Container erstellen mit 2 PostgreSQL DBs edit und Pub. Inkl. Schema arp_npl in beiden DBs.

```
  docker-compose down # (this command is optional; it's just for cleaning up any already existing DB containers)
  docker-compose run --rm --user $UID -v $PWD/development_dbs:/home/gradle/project gretl "sleep 20 && cd /home/gradle && gretl -b project/build-dev.gradle createSchemaLandUsePlans replaceDataLandUsePlans createSchemaLandUsePlansPub"
```

ENV Variablen auf die "Container"-DB setzen:
```
  export ORG_GRADLE_PROJECT_dbUriEdit="jdbc:postgresql://edit-db/edit"
  export ORG_GRADLE_PROJECT_dbUserEdit="gretl"
  export ORG_GRADLE_PROJECT_dbPwdEdit="gretl"
  export ORG_GRADLE_PROJECT_dbUriPub="jdbc:postgresql://pub-db/pub"
  export ORG_GRADLE_PROJECT_dbUserPub="gretl"
  export ORG_GRADLE_PROJECT_dbPwdPub="gretl"

```

NPL Daten in die edit-DB importieren:

Start the GRETL job (use the --job-directory option to point to the desired GRETL job; find out the names of your Docker networks by running docker network ls):
```
  sudo -E $PWD/start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network arpnplili2pg431_default --job-directory $PWD/arp_npl_import/  replaceDataset -Pxtf=2408.xtf
```

NPL Daten von der Edit-DB in die Pub-DB kopieren
```
  sudo -E $PWD/start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network arpnplili2pg431_default --job-directory $PWD/arp_npl_pub/
  ```
