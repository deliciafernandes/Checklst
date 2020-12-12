
# Checklst : Reminder App :pushpin:

### Table of Contents
1. <a href="#Details">Project Details</a>
2. <a href="#FS">File Structure</a>

---

### <a name="Details">1. Project Details</a>
Cross Platform Location Based Reminder App with Cloud Functionality.

**To test the app yourself:**
1. Download the latest [Checklst.apk](https://github.com/deliciafernandes/Checklst/releases/tag/v2.0.0) release in your mobile device.
2. Install the app.
3. Ready to use! 😊

**Show me the result, I'm too lazy to test:** [Checkout this video!](https://github.com/deliciafernandes/Checklst/blob/main/Checklst.mov)

### <a name="FS">2. File Structure</a>
(1) [Native Android Code](https://github.com/deliciafernandes/Checklst/tree/main/android)
<br>(2) [Native iOS Code](https://github.com/deliciafernandes/Checklst/tree/main/ios)
<br>(3) [Assets folder](https://github.com/deliciafernandes/Checklst/tree/main/assets)
<br>(4) [Packages file, pubspec.yaml](https://github.com/deliciafernandes/Checklst/blob/main/pubspec.yaml "pubspec.yaml")
<br>(5) [Flutter Code in Library Folder](https://github.com/deliciafernandes/Checklst/tree/main/lib)

# Once cloned, follow:

### Android:
1. This is a no brainer, "android/app/google-services.json"
2. Make sure app has a local.properties file in the `Project -> Android` folder, if not:
	* Go to your  `Project -> Android`
	* Create a file  `local.properties` file
	* Open the file and Paste your Android SDK path depending on the operating system:
		a. Windows
			`sdk.dir = C:/Users/USERNAME/AppData/Local/Android/sdk`
		
		b. Linux or MacOS
			`sdk.dir = /home/USERNAME/Android/sdk`

		Replace  `USERNAME`  with your user name

3. Next, in `local.properties` add Google Maps API Key!
4. If you don't have Google Maps Setup,  follow [Adding Google Maps API key to Android App precisely!](https://developers.google.com/maps/documentation/android-sdk/get-api-key)

## After setup, Run:
- flutter clean
- flutter doctor
- flutter pub get
- flutter run

**iOS Specific, `cd ios`**
- pod repo update
- pod update
- sudo gem install cocoapods
- pod setup
- flutter run

---
### **How to Contribute:**

1. Clone repo and create a new branch: `$ https://github.com/deliciafernandes/Checklst -b name_for_new_branch`.
2. Make changes and test.
3. Submit Pull Request with comprehensive description of changes.
