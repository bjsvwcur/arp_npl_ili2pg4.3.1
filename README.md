# arp_npl_ili2pg4.3.1
Create Schema und Import Daten der Nutzungsplanung mit ili2pg V 4.3.1

Git clonen:
```
  git clone https://github.com/bjsvwcur/arp_npl_ili2pg4.3.1.git
```

```
docker-compose run --rm --user $UID -v $PWD/development_dbs:/home/gradle/project gretl "sleep 20 && cd /home/gradle && gretl -b project/build-dev.gradle createSchemaLandUsePlans replaceDataLandUsePlans"
```

Set environment variables containing the DB connection parameters and names of other resources:
```
  export ORG_GRADLE_PROJECT_dbUriEdit="jdbc:postgresql://edit-db/edit"
  export ORG_GRADLE_PROJECT_dbUserEdit="gretl"
  export ORG_GRADLE_PROJECT_dbPwdEdit="gretl"
```
