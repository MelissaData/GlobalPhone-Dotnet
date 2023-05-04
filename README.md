# Melissa - Global Phone Cloud API

## Purpose
This code showcases the Melissa Global Phone Cloud API using C#.

Please feel free to copy or embed this code to your own project. Happy coding!

For the latest Melissa Global Phone release notes, please visit: https://releasenotes.melissa.com/cloud-api/global-phone/

For further documentation, please visit: https://www.melissa.com/quickstart-guides/global-phone

The console will ask the user for:

- Phone 

And return information of the phone number such as:

- Results
- PhoneNumber
- AdministrativeArea
- CountryAbbreviation
- CountryName
- Carrier
- CallerID
- DST
- InternationalPhoneNumber
- Language
- Latitude and Longitude
- Locality
- PhoneInternationalPrefix
- PhoneCountryDialingCode
- PhoneNationPrefix
- PhoneNationalDestinationCode
- PhoneSubscriberNumber
- UTC
- TimeZoneCode and TimeZoneName
- PostalCode
- Suggestions

## Tested Environments
- Windows 64-bit .NET 7.0
- Global Phone Cloud API Version 7.3.0.1152

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Install the Dotnet Core SDK
Before starting, make sure that the .NET 7.0 SDK has been correctly installed on your machine (If you have Visual Studio installed, you most likely have it already). If you are unsure, you can check by opening a command prompt window and typing the following:

`dotnet --list-sdks`

If the .NET 7.0 SDK is already installed, you should see it in the following list:

![alt text](/screenshots/dotnet_output.png)

As long as the above list contains version `7.0.xxx` (underlined in red), then you can skip to the next step. If your list does not contain version 7.0, or you get any kind of error message, then you will need to download and install the .NET 7.0 SDK from the Microsoft website.

To download, follow this link: https://dotnet.microsoft.com/en-us/download/dotnet

Select `.NET 7.0` and you will be navigated to the download page.

Click and download the `x64` SDK installer for your operating system.

(IMPORTANT: Make sure you download the SDK, NOT the runtime. the SDK contains both the runtime as well as the tools needed to build the project.)

![alt text](/screenshots/net7.png)

Once clicked, your web browser will begin downloading an installer for the SDK. Run the installer and follow all of the prompts to complete the installation (your computer may ask you to restart before you can continue). Once all of that is done, you should be able to verify that the SDK is installed with the `dotnet --list-sdks` command.


### Download this project
```
$ git clone git remote add origin https://github.com/MelissaData/GlobalPhone-Dotnet.git
$ cd GlobalPhone-Dotnet
```

## Run Powershell Script
Parameters:
- -phone: an input phone number
 	
  This is convenient when you want to get results for a specific phone number in one run instead of testing multiple records in interactive mode.  

- -license (optional): a license string to test the Cloud API

There are two modes:

- Interactive 

	The script will prompt the user for input(s), then use the provided input(s) to call the Cloud API. For example:
	```
	$ .\GlobalPhone.ps1
	```

- Command Line 

	You can pass a phone number and a license string into `-phone` and `-license` parameters respectively to test the Cloud API. For example: 
	```
    $ .\GlobalPhone.ps1 -phone "800-635-4772" 
    $ .\GlobalPhone.ps1 -phone "800-635-4772" -license "<your_license_string>"
    ```
	
This is the expected output from a successful setup for interactive mode:

![alt text](/screenshots/output.png)

## Result Codes
For details about the result codes please refer to https://wiki.melissadata.com/index.php?title=Result_Code_Details#Global_Phone

## Contact Us
For free technical support, please call us at 800-MELISSA ext. 4 (800-635-4772 ext. 4) or email us at tech@melissa.com.

To purchase this product, contact the Melissa sales department at 800-MELISSA ext. 3 (800-635-4772 ext. 3).
