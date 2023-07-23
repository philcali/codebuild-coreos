Name:           grubless
Version:        1.0.0
Release:        1%{?dist}
Summary:        A dynamically created package for grubless firstboots of CoreOS

License:        MIT
URL:            https://github.com/philcali/codebuild-coreos.git
Source0:        %{name}-%{version}.tar.gz

ExclusiveArch:  x86_64

BuildRequires:  systemd-boot
Requires:       systemd-udev

%description
A dynamically created package for grubless firstboots of CoreOS

%prep
%autosetup


%install
rm -rf $RPM_BUILD_ROOT
install -D -d -m 0755 $RPM_BUILD_ROOT/boot/
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi/EFI
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi/EFI/BOOT
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi/EFI/Linux
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi/EFI/fedora
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi/loader
install -D -d -m 0700 $RPM_BUILD_ROOT/boot/efi/loader/entries
install -D -d -m 0755 $RPM_BUILD_ROOT/boot/efi/firstboot
cp systemd-bootx64.efi $RPM_BUILD_ROOT/boot/efi/EFI/Linux/
cp systemd-bootx64.efi $RPM_BUILD_ROOT/boot/efi/EFI/BOOT/BOOTX64.EFI
cp loader.conf $RPM_BUILD_ROOT/boot/efi/loader/
cp firstboot-1-fcbls.conf $RPM_BUILD_ROOT/boot/efi/loader/entries/
cp initramfs.img $RPM_BUILD_ROOT/boot/efi/firstboot/
cp vmlinuz $RPM_BUILD_ROOT/boot/efi/firstboot/

%files
%defattr(0700,root,root,-)
%dir /boot/efi/loader
%dir /boot/efi/loader/entries
%dir /boot/efi/firstboot
/boot/efi/EFI/Linux/systemd-bootx64.efi
/boot/efi/EFI/BOOT/BOOTX64.EFI
/boot/efi/loader/loader.conf
/boot/efi/loader/entries/firstboot-1-fcbls.conf
/boot/efi/firstboot/initramfs.img
/boot/efi/firstboot/vmlinuz


%changelog
* Sat Jul 15 2023 Super User
- 
