# HANA PAL
Follow the steps as shown in the video to create a HANA database.
1.	Log on to https://account.hanatrial.ondemand.com
2.	Create a new database. (Database creation may take up to 20 mins)
3.	Create a new user for the DB.
4.	Assign required roles to the user.
```
    sap.hana.xs.ide.roles::CatalogDeveloper
    sap.hana.xs.ide.roles::Developer
    sap.hana.xs.ide.roles::EditorDeveloper
    sap.hana.xs.ide.roles::SecurityAdmin
    sap.hana.xs.ide.roles::TraceViewer
    AFL__SYS_AFL_APL_AREA_EXECUTE
    AFLPM_CREATOR_ERASER_EXECUTE
```
5.	Access the Catalog using the new user.

