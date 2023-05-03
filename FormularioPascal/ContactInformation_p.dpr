program ContactInformation_p;

uses
  Vcl.Forms,
  frmContactForm_u in '..\Contact Information Backup\frmContactForm_u.pas' {frmContact};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmContact, frmContact);
  Application.Run;
end.
