- ## Example `unattended.xml` file

```xml
<?xml version="1.0" encoding="utf-8"?>
<unattend xmlns="urn:schemas-microsoft-com:unattend">
  <settings pass="windowsPE">
    <component
      name="Microsoft-Windows-International-Core-WinPE"
      processorArchitecture="amd64"
      publicKeyToken="31bf3856ad364e35"
      language="neutral"
      versionScope="nonSxS">
      
      <!-- Change the language to German (de-DE) -->
      <SetupUILanguage>
        <UILanguage>de-DE</UILanguage>
      </SetupUILanguage>
      
      <InputLocale>de-DE</InputLocale>
      <SystemLocale>de-DE</SystemLocale>
      <UILanguage>de-DE</UILanguage>
      <UserLocale>de-DE</UserLocale>
      
    </component>
    <component
      name="Microsoft-Windows-Setup"
      processorArchitecture="amd64"
      publicKeyToken="31bf3856ad364e35"
      language="neutral"
      versionScope="nonSxS">
      
      <!-- Disk and partition configuration (can be customized) -->
      <DiskConfiguration>
        <Disk wcm:action="add">
          <DiskID>0</DiskID>
          <WillWipeDisk>true</WillWipeDisk>
          <CreatePartitions>
            <CreatePartition wcm:action="add">
              <Order>1</Order>
              <Type>Primary</Type>
              <Size>100</Size>
            </CreatePartition>
            <CreatePartition wcm:action="add">
              <Order>2</Order>
              <Type>Primary</Type>
              <Extend>true</Extend>
            </CreatePartition>
          </CreatePartitions>
          <ModifyPartitions>
            <ModifyPartition wcm:action="add">
              <Order>1</Order>
              <PartitionID>1</PartitionID>
              <Label>System</Label>
              <Format>NTFS</Format>
              <Active>true</Active>
            </ModifyPartition>
            <ModifyPartition wcm:action="add">
              <Order>2</Order>
              <PartitionID>2</PartitionID>
              <Label>Windows</Label>
              <Format>NTFS</Format>
            </ModifyPartition>
          </ModifyPartitions>
        </Disk>
      </DiskConfiguration>

      <!-- Specify OS image to install -->
      <ImageInstall>
        <OSImage>
          <InstallTo>
            <DiskID>0</DiskID>
            <PartitionID>2</PartitionID>
          </InstallTo>
        </OSImage>
      </ImageInstall>
    </component>
  </settings>
</unattend>
