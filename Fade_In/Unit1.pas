unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Jpeg, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    image1: TImage;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);

 procedure JMC(const BMP: TImage; Pause: integer);
 var
     BytesPourScan : integer;
     w,h           : integer;
     p             : pByteArray;
     jmccouleurs   : integer;
   begin

     If Not (BMP.Picture.Bitmap.PixelFormat in [pf24Bit, pf32Bit])
     then raise exception.create( 'Erreur, format de bitmap non supporté.'+
                                   #13+
                                   'Erreur, format de bitmap non supporté.'
                                   );
     try
       BytesPourScan:=Abs ( Integer(BMP.Picture.Bitmap.ScanLine[1])-
                           Integer(BMP.Picture.Bitmap.ScanLine[0]));
     except
       raise exception.create('Erreur');
     end;


     for jmccouleurs:=1 to 150 do //Réglages de l'intensité 1 à 255
     begin
       for h:=0 to BMP.Picture.Bitmap.Height-1 do
       begin
         P:=BMP.Picture.Bitmap.ScanLine[h];
         for w:=0 to BytesPourScan-1 do
           if P^[w] >0 then P^[w]:=P^[w]-1;
       end;
     Sleep(Pause);
     BMP.Refresh;
    end;
   end;

begin
 JMC(Image1,9);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 Button1click(sender);
 Timer1.enabled := false
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 Timer1.enabled := true
end;

end.
