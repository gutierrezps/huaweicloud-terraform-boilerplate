# 👣 First Steps with Huawei Cloud Terraform

🔙 Back to [README](../README.md).

🌐 **Language**: **English** | [Português](./FIRST_STEPS.pt.md)

## Installation

Install Terraform: <https://developer.hashicorp.com/terraform/install>

### Windows

1. Download the zip file
2. Extract `terraform.exe` in `C:\Windows` folder (or in another folder which
   is added to your system path);
3. Open a command prompt or Powershell and run `terraform.exe -version` to
   confirm it was installed successfully.

## Ubuntu/Debian

Run the following commands:

```sh
sudo apt update && sudo apt install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install -y terraform
```

Check if Terraform is installed:

```sh
terraform -version
```

## Creating an access key (AK and SK)

An access key comprises an **access key ID (AK)** and **secret access key (SK)**,
and is used as a long-term identity credential to sign your requests for Huawei
Cloud APIs (used by Terraform provider). AK is used together with SK to sign
requests cryptographically, ensuring that the requests are secret, complete,
and correct. For more details, see
[Access Keys documentation](https://support.huaweicloud.com/intl/en-us/usermanual-ca/ca_01_0003.html)

To create an access key for your account, first log in to
[Huawei Cloud Console](https://console-intl.huaweicloud.com/).

1. Put your mouse over your username in the top right corner (A) and click on
   "My Credentials" (B) in the dropdown menu;

    !["My Credentials" option (B) under username (A)](img/my-credentials.jpg)

2. On the left side menu, click on "Access Keys" and then click on "Create
   Access Key";

    !["Access Keys" (C) option in the left menu and "Create Access Key" (D) button](img/create-access-key.jpg)

3. Enter a description (optional) and then click on "OK";

    ![Enter a description (E) and click on "OK" (F)](img/new-access-key-modal.jpg)

4. Click on "Download" (G) in the modal message. A file named `credentials.csv`
   will be saved;

   !["Download" button (G) after creating the access key](img/access-key-download.jpg)

5. Open the `credentials.csv` file in Notepad. It should have the following
   layout:

    ```plain
    User Name,Access Key Id,Secret Access Key
    "username",**********,##########
    ```

6. On the second line, the second part is the Access Key (AK), and the third
   part is the Secret Key (SK).
