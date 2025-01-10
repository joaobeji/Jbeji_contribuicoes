# ManipulacaoCustomizacaoTDBGrid

Este repositório contém um módulo Delphi com funções utilitárias para manipulação e customização de componentes `TDBGrid`.
Ele facilita ajustes visuais, comportamentais e estéticos em aplicações Delphi que utilizam grids para exibição de dados.

### **1. FuncoesGenerics**

Este módulo contém métodos utilitários para manipulação de componentes `TDBGrid` e outros comportamentos visuais e funcionais comuns em aplicações Delphi.

- **Funções e Procedimentos:**

  - AjustarTamanhoLinha
  - DrawColumnCell
  - RemoverBarraRolagem
  - AjustaColunas
  - TirarBeepEnter

- **Padrão de Nomeação:**
  Este módulo utiliza um padrão de nomeação para facilitar a leitura e manutenção do código, adotado em diversas práticas da indústria de software:

  - **Prefixo `p` para parâmetros**: Indica que a variável é um parâmetro passado para a função ou procedimento.  
    Exemplo: `pDBGrid`, `pWidth`.

  - **Prefixo `v` para variáveis locais**: Indica que a variável é declarada e usada localmente dentro de uma função ou procedimento.  
    Exemplo: `vContarColunas`, `vLarguraColuna`.

  **Benefícios:**

  - **Clareza:** Facilita a identificação do escopo da variável ao bater os olhos no código.
  - **Organização:** Reduz a chance de confundir variáveis locais com parâmetros.
  - **Consistência:** Seguir um padrão torna o código mais legível para outros desenvolvedores.

  **Exemplo Prático:**

  ```pascal
  procedure AjustaColunas(pDBGrid: TDBGrid; pWidth: Integer);
  var
    vContarColunas: Integer;
  begin
    vContarColunas := pDBGrid.Columns.Count;
    // Uso do parâmetro pWidth e variável local vContarColunas
  end;
  ```

---

## **Conteúdo Principal**

O arquivo principal do projeto é:

- `ManipulacaoCustomizacaoTDBGrid.pas`: Contém as funções e procedimentos documentados abaixo.

---

## **Funções e Procedimentos**

### **2. AjustarTamanhoLinha**

Define a altura padrão de cada linha em um `TDBGrid`.

- **Parâmetros**:
  - `pDBGrid: TDBGrid`: Componente que terá a altura ajustada.
  - `pTamanho: Integer`: Altura desejada para as linhas (em pixels).

---

### **3. DrawColumnCell**

Personaliza a aparência das células de um `TDBGrid`, aplicando cores alternadas (“zebra”) e estilização de seleção.

- **Parâmetros**:
  - `pDBGrid: TDBGrid`: Componente a ser estilizado.
  - `pRect: TRect`: Retângulo delimitador da célula.
  - `pDataCol: Integer`: Índice da coluna.
  - `pColumn: TColumn`: Coluna correspondente.
  - `pState: TGridDrawState`: Estado da célula.

---

### **4. RemoverBarraRolagem**

Remove as barras de rolagem (vertical e horizontal) de um `TDBGrid`.

- **Parâmetros**:
  - `pDBGrid: TDBGrid`: Componente que terá as barras removidas.

---

### **5. AjustaColunas**

Ajusta automaticamente a largura das colunas de um `TDBGrid` com base na largura total e no número de colunas.

- **Parâmetros**:

  - `pDBGrid: TDBGrid`: Componente que terá as colunas ajustadas.
  - `pWidth: Integer`: Largura total do grid.

- **Detalhes**: Utiliza um array bidimensional para calcular as proporções de cada coluna, suportando entre 3 e 14 colunas.

---

### **6. TirarBeepEnter**

Previne o som de "beep" ao pressionar a tecla **Enter** em componentes de entrada.

- **Parâmetros**:

  - `Key: Char`: A tecla pressionada.

- **Retorno**:

  - `Boolean`: Indica se a tecla foi tratada (retorna `True` se **Enter** foi pressionado).

---

## **Como Utilizar**

1. **Adicionar ao Projeto**:

   - Inclua o arquivo `ManipulacaoCustomizacaoTDBGrid.pas` no seu projeto Delphi.
   - Adicione `ManipulacaoCustomizacaoTDBGrid` à seção `uses` da sua unit principal.

2. **Exemplo de Configuração de um **``:

```pascal
procedure TForm1.ConfigurarDBGrid;
begin
  AjustarTamanhoLinha(DBGrid1, 20); // Define altura das linhas
  RemoverBarraRolagem(DBGrid1); // Remove barras de rolagem
  AjustaColunas(DBGrid1, DBGrid1.Width); // Ajusta larguras das colunas
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  DrawColumnCell(TDBGrid(Sender), Rect, DataCol, Column, State);
end;
```

---

## **Licença**

Este projeto está licenciado sob a [MIT License](LICENSE). Você é livre para usar, modificar e distribuir este código, desde que seja mantida a atribuição ao autor original.

---

## **Contribuições**

Contribuições são bem-vindas! Para sugerir melhorias, abra um **Pull Request** ou crie uma **Issue**.

---

**Autor:** Desenvolvido para aplicações Delphi que utilizam `TDBGrid` como elemento de interface principal.
