unit frmContactForm_u;

{1, 2, 3: Contiene las declaraci�ns de todos los componentes que se colocan en el Form}

interface {1}

uses {2}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type {3}
  TfrmContact = class(TForm)
    pnlHeader: TPanel;
    pnlPersonalInformation: TPanel;
    pnlAddressInformation: TPanel;
    pnlContactInformacion: TPanel;
    pnlActions: TPanel;
    btnDisplay: TButton;
    bmbReset: TBitBtn;
    bmbClose: TBitBtn;
    lblFirstName: TLabel;
    lblSurname: TLabel;
    lblGender: TLabel;
    lblAge: TLabel;
    lblStreet: TLabel;
    lblCity: TLabel;
    lblCountry: TLabel;
    lblPostalCode: TLabel;
    lblTelephone: TLabel;
    lblEmail: TLabel;
    edtFirstName: TEdit;
    edtSurname: TEdit;
    edtStreet: TEdit;
    edtCity: TEdit;
    edtCountry: TEdit;
    edtPostalCode: TEdit;
    edtTelephone: TEdit;
    edtEmail: TEdit;
    cbxGender: TComboBox;
    sedAge: TSpinEdit;
    imgPhoto: TImage;
    chkSendNewsLetter: TCheckBox;
    redOutput: TRichEdit;
    procedure btnDisplayMouseEnter(Sender: TObject);
    procedure btnDisplayMouseLeave(Sender: TObject);
    procedure bmbResetClick(Sender: TObject);
    procedure btnDisplayClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmContact: TfrmContact;

  {1, 2 - Secci�n de implementaci�n: }
implementation {1}

{$R *.dfm} {2}

{Resetea todos los componentes a su estado original}
procedure TfrmContact.bmbResetClick(Sender: TObject);
begin
      edtFirstName.Clear; //Limpia el objeto FirstName Edit y lo deja vac�o
      edtSurname.Clear; //Limpia el objeto SurName Edit y lo deja vac�o
      edtStreet.Clear;
      edtCity.Clear;
      edtCountry.Clear;
      edtPostalCode.Clear;
      edtTelephone.Clear;
      edtEmail.Clear;
      redOutput.Clear; {Borra el mensaje que aparece del objeto TRichEdit}


    {Las siguientes lineas de c�digo no son llamados a m�todos}
    {Pero debemos cambiar algunas propiedades para resetear los elementos del Form a sus valores originales}

    {1}
    {Combo Box}
      cbxGender.ItemIndex := 0; {Un Index en Programaci�n ES SIEMPRE UN N�MERO (Integer)}
    {Cada �tem en un Combo Box siempre es un llamado a una propiedad llamado ItemIndex}
    {El primer �tem en un Combo Box siempre es de 0 (En este caso dentro de ese 0 se encuentra el valor "Male")}
    {Por lo tanto, 1 ser�a el segundo valor "Female"}
    {2}
    {Spin Edit}
      sedAge.Value := 20; {Cuando se resetee, el valor original volver� a ser de 20}
    {3}
    {Check Box de Send Newsletter}
      chkSendNewsLetter.Checked := True;
    {4}
    {Form Caption}
      frmContact.Caption := 'Contact Form';
    {5}
    {TRich Edit de vuelva a blanco}
      redOutput.Color := clWhite;


    {6}
    {Cuando reseetemos el Form, el programa pasar� a enfocar el cursor en el primer Edit del nombre}
      edtFirstName.SetFocus;


end;

procedure TfrmContact.btnDisplayClick(Sender: TObject);
begin
    {ACTUALIZACI�N 25-1-2023: Dado lo visto recientemente, me cre� un segundo
    bot�n de btnDisplay, para trabajar con variables en este Form. Pero
    consecuentemenete como resultado, este bot�n estar� comentado mas adelante}

      redOutput.Color := clYellow; {Cambia el TRichEdit a amarillo cuando se presiona el boton de Display}
      frmContact.Caption := 'Displaying Contact Information'; {Cambio el t�tulo del Form a esto}
    {redOutput.Lines.Add('Displaying Contact Informacion');} {A�ado una l�nea de texto al objeto TRichEdit}
          {Lines tambi�n es un Objeto}
          {.Add es un m�todo que se le asigna a la propiedad Lines}
    {Los m�todos normalmente son verbos}
    {ACTUALIZACI�N (obsoleta): Ya no se usar� el c�digo escrito en la linea 113, ya que s�lo fue usado a modo de prueba en el transcurso del curso de Delphi}


    {1}
      redOutput.Lines.Add('INFORMATION FOR ' + UpperCase(edtFirstName.Text + ' ' +
                                                          edtSurname.Text)); {Usamos un + en textos para hacer concatenaci�n, como en todos los lenguajes que has trabajado}
    {ERROR COM�N: Incompatible string y TEdit: Al ser objetos, por supuesto no va a tomarlo como un string}
    {Para eso existe la propiedad "Text" que pasa los valores ingresados en los mismos a un formato String}
    {Funcion UpperCase: Cambia todo el objeto a may�sculas}
    {2}
    {APLICAMOS CONCATENACI�N AL RESTO DE LOS OBJETOS}
      redOutput.Lines.Add('');
      redOutput.Lines.Add('Gender ' + cbxGender.Text);
      redOutput.Lines.Add('Adress: ' + edtStreet.Text + ', ' + edtCity.Text + ', ' +
                    UpperCase(edtCountry.Text) + ', ' + edtPostalCode.Text);
      redOutput.Lines.Add('Telephone: ' + edtTelephone.Text);
      redOutput.Lines.Add('Email: ' + LowerCase(edtEmail.Text));
    {Funcion LowerCase: Cambia todo el objeto a min�sculas. Pide un string de input, y retorna el mismo como output}

      redOutput.Lines.Add('Contact Code: ' + UpperCase(Copy(edtFirstName.Text, 1, 3)
                    + Copy(edtSurname.Text, 1, 3))); {Concatena el nombre y el apellido}

    {Convirtiendo Integers a Strings en Delphi}
      redOutput.Lines.Add('Age: ' + IntToStr(sedAge.Value));
      redOutput.Lines.Add('Age after 5 years: ' + IntToStr(sedAge.Value + 5)); {Con la funci�n Value, podemos pasar un valor de 5 para que el valor que sea ingresado, se sume + 5}
      redOutput.Lines.Add('Approximate age in months: ' + IntToStr(sedAge.Value * 12)); {Usamos un asterisco para multiplicar}

    {Convirtiendo Numeros reales a Strings en Delphi}
      redOutput.Lines.Add('Age in Decades: ' + FloatToStr(sedAge.Value / 10)); {Dividimos la edad en d�cadas}
      redOutput.Lines.Add('Age in Centuries: ' + FloatToStr(sedAge.Value / 100));
      redOutput.Lines.Add('Age in Millennia: ' + FloatToStr(sedAge.Value / 1000));
end;

procedure TfrmContact.btnDisplayMouseEnter(Sender: TObject);
begin
      btnDisplay.Left := 5; {Cambia la propiedad "Left" de 15 a 5}
      btnDisplay.Width := 90; {Cambia la propiedad del ancho "Width" a 90}
      btnDisplay.Caption := 'Click to Display'; {Cambia el nombre del bot�n a Click to Display}
end;

procedure TfrmContact.btnDisplayMouseLeave(Sender: TObject);
begin
      btnDisplay.Left := 15;
      btnDisplay.Width := 75;
      btnDisplay.Caption := 'Display';

end;

end.
