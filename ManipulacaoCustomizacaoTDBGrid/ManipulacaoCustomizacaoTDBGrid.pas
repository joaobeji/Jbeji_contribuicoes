unit ManipulacaoCustomizacaoTDBGrid;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

procedure AjustarTamanhoLinha(pDBGrid: TDBGrid; pTamanho: Integer);
procedure DrawColumnCell(pDBGrid: TDBGrid; const pRect: TRect;
  pDataCol: Integer; pColumn: TColumn; pState: TGridDrawState);
procedure RemoverBarraRolagem(pDBGrid: TDBGrid);
procedure AjustaColunas(pDBGrid: TDBGrid; pWidth: Integer);
function TirarBeepEnter(var Key: Char): Boolean;

type
  TDBGridPadrao = class(TCustomGrid);

implementation

function TirarBeepEnter(var Key: Char): Boolean;
begin

  if Key = #13 then
  begin

    Key := #0; // Tirar o beep quando se pressiona enter num edit
    Result := True;

  end;

end;

procedure AjustarTamanhoLinha(pDBGrid: TDBGrid; pTamanho: Integer);
begin

  // Definir o tamanho de cada linha do dbgrid apos ativar a query
  TDBGridPadrao(pDBGrid).DefaultRowHeight := pTamanho;

end;

procedure RemoverBarraRolagem(pDBGrid: TDBGrid);
begin

  { Remove barra vertical do DBgrid1 }
  ShowScrollBar(pDBGrid.handle, SB_VERT, False);

  { Remove barra horizontal do DBgrid1 }
  ShowScrollBar(pDBGrid.handle, SB_HORZ, False);

end;

procedure DrawColumnCell(pDBGrid: TDBGrid; const pRect: TRect;
  pDataCol: Integer; pColumn: TColumn; pState: TGridDrawState);
begin

  // Zebraado o grid
  if Odd(pDBGrid.DataSource.DataSet.RecNo) then
    pDBGrid.Canvas.Brush.Color := $00FEEBEB
  else
    pDBGrid.Canvas.Brush.Color := clWhite;

  // Mudar a cor da seleção
  if (gdSelected in pState) then
  begin

    pDBGrid.Canvas.Brush.Color := $00F18080;
    pDBGrid.Canvas.Font.Color := clWhite;
    pDBGrid.Canvas.Font.Style := [fsBold];

  end;

  pDBGrid.Canvas.FillRect(pRect);
  pDBGrid.DefaultDrawColumnCell(pRect, pDataCol, pColumn, pState);
  // pDBGrid.Canvas.TextRect(pRect, pRect.Left + 5, (pRect.Top + 1),
  // pColumn.Field.DisplayText);

end;

procedure AjustaColunas(pDBGrid: TDBGrid; pWidth: Integer);
const
  vLarguraColuna: array [0 .. 8, 0 .. 13] of Double = (

    // Configurações para diferentes contagens de colunas
    (10, 58, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), // 3 colunas
    (7, 40, 25, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), // 4 colunas
    (10, 46, 15, 15, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0), // 5 colunas
    (7, 30, 20, 20, 11, 10, 0, 0, 0, 0, 0, 0, 0, 0), // 6 colunas
    (7, 25, 20, 13, 15, 10, 7, 0, 0, 0, 0, 0, 0, 0), // 7 colunas
    (5, 28, 20, 7.5, 7.5, 7.5, 7.5, 7, 6, 0, 0, 0, 0, 0), // 9 colunas
    (3, 20, 15, 3, 15, 15, 3, 5, 7, 7, 15, 7, 0, 0), // 12 colunas
    (5, 24, 11, 11, 3, 5.8, 5.8, 3, 5, 5.6, 5.8, 5.8, 5.8, 5.8), // 14 colunas

    (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    // Extra (se necessário para alinhar índices)
    );
var
  i, vContarColunas: Integer;
begin

  vContarColunas := pDBGrid.Columns.Count;

  case vContarColunas of
    3 .. 14: // Somente processa contagens suportadas no array
      for i := 0 to vContarColunas - 1 do
        pDBGrid.Columns[i].Width :=
          Round((pWidth / 100) * vLarguraColuna[vContarColunas - 3, i]);
  end;

  if vContarColunas > 0 then
    pDBGrid.Columns[0].Alignment := taRightJustify;

end;

end.
