# DSI Automation

## Overview

These are a set of SuiteScirpt scripts that help with the process of setup and configuration of DSI Direct and Users.

**Please be sure _NOT_ to rename any files.**

## How-To

### packages_import_suitelet.js

1. In Netsuite, go to *Customization > Scripting > Scripts > New*.

2. Next to the <select><option>Script File</option></select>, click the `+` icon.

3. Upload the file: `packages_import_suitelet.js` by clicking <button>Choose File</button>. Click <button>Save</button>.

4. Click the <button>Create Script Record</button>.

5. Enter the following as the id `_pref_packages_import`.

6. Click on the *Deployments* sub-tab, in the *TITLE* dropdown, enter `Pref Packages Import Suitelet`, make the id `_pref_packages_import`, hit <kbd>Enter</kbd>.

7. Click <button>Save</button>, then select the *Deployments* sub-tab, edit the deployment you just created.

8. In the *Audience* sub-tab, check the <input type='checkbox' checked />'s for *ALL ROLES*, *ALL EMPLOYEES*, and *ALL PARTNERS*.

9. Make sure the status is *Released*. Click <button>Save</button>.


### AddAllApps_Client.js

1. In Netsuite, go to *Customization > Scripting > Scripts > New*.

2. Next to the <select><option>Script File</option></select>, click the `+` icon.

3. Upload the file: `AddAllApps_Client.js` by clicking <button>Choose File</button>. Click <button>Save</button>.

4. Click the <button>Create Script Record</button>.

4. Enter the following as the id `_addallapps_client` and then click <button>Save</button>.


### AddAllApps_UE.js

1. In Netsuite, go to *Customization > Scripting > Scripts > New*.

2. Next to the <select><option>Script File</option></select>, click the `+` icon.

3. Upload the file: `AddAllApps_UE.js` by clicking <button>Choose File</button>. Click <button>Save</button>.

4. Click the <button>Create Script Record</button>

5. Enter the following as the id `_addallapps_ue`.

6. Click on the *Deployments* sub-tab, in the *APPLIES TO* dropdown, find and select DSI Configurations, make the id `_addallapps_ue_config`, hit <kbd>Enter</kbd>.

7. In the *APPLIES TO* dropdown, find and select `DSI Users 2`, make the id `_addallapps_ue_users`, hit <kbd>Enter</kbd>.

8. Click <button>Save</button>, then select the *Deployments* sub-tab, edit each deployment you just created.

9. In the *Audience* sub-tab, check the <input type='checkbox' checked />'s for *ALL ROLES*, *ALL EMPLOYEES*, and *ALL PARTNERS*.

10. Make sure the status is *Released*. Click <button>Save</button>.