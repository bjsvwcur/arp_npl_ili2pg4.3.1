# arp_npl_ili2pg4.3.1
Create Schema und Import Daten der Nutzungsplanung mit ili2pg V 4.3.1

Git clonen:
```
  git clone https://github.com/bjsvwcur/arp_npl_ili2pg4.3.1.git
```

```
  docker-compose run --rm --user $UID -v $PWD/development_dbs:/home/gradle/project gretl "sleep 20 && cd /home/gradle && gretl -b project/build-dev.gradle createSchemaLandUsePlans replaceDataLandUsePlans"
```

ENV Variablen auf die "Container"-DB setzen:
```
  export ORG_GRADLE_PROJECT_dbUriEdit="jdbc:postgresql://edit-db/edit"
  export ORG_GRADLE_PROJECT_dbUserEdit="gretl"
  export ORG_GRADLE_PROJECT_dbPwdEdit="gretl"
```

NPL Daten in die DB importieren:
```
  sudo -E $PWD/start-gretl.sh --docker-image sogis/gretl-runtime:latest --docker-network arpnplili2pg431_nplgretljobs --job-directory $PWD/arp_npl_import/  replaceDataset -Pxtf=2408.xtf
```
