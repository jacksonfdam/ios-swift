## Adicionando itens

No final deste tutorial, o usuário será capaz de adicionar novos itens de tarefas pressionando um botão na barra de navegação, apresentando uma view com um campo de texto e um botão. Vamos começar criando a view controller que manipulará a adição de novos itens de tarefas, a classe  `AddItemViewController`.

### Passo 1: Criar  `AddItemViewController`

Escolha  **New > File...**  no menu  **File**  do Xcode e selecione o template  **Cocoa Class**  da lista dos templates  **iOS > Source**.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23445/image/figure-create-class-1.jpg)

Nomeie a classe de `AddItemViewController`  e verifique se ela herda da  `UIViewController`. Verifique se a  **Language**  está definida para  **Swift**  e também se  **Also create XIB**  está desmarcado.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23445/image/figure-create-class-2.jpg)

Informe ao Xcode onde você gostaria de salvar o arquivo da classe  `AddItemViewController`  e clique em  **Create**.

### Passo 2: Adicionando outlets e ações (actions)

Antes de criarmos a interface da classe  `AddItemViewController`, precisamos criar um outlet para o text field e duas ações, uma para um botão cancelar na barra de navegação e outra para o botão criar, abaixo do text field.

Adicionar um outlet parecerá familiar neste momento. Crie um outlet na classe  `AddItemViewController`  e nomeie de `textField`, como mostrado abaixo.

01

02

03

04

05

06

07

08

09

10

11

`class` `AddItemViewController: UIViewController {`

`@IBOutlet` `var` `textField: UITextField!`

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`}`

`override func didReceiveMemoryWarning() {`

`super``.didReceiveMemoryWarning()`

`}`

`}`

Criar uma ação é muito semelhante à criação de um método de instância. Na verdade, o atributo  `@IBAction` nada mais é do que uma dica para o Interface Builder. Ao iniciar um método com o atributo  `@IBAction`, o Interface Builder fica ciente do método, que permite conectá-lo no storyboard. Deixaremos o corpo de ambas as ações vazios por enquanto.

01

02

03

04

05

06

07

08

09

10

11

12

13

14

15

16

17

18

19

`class` `AddItemViewController: UIViewController {`

`@IBOutlet` `var` `textField: UITextField!`

`override func viewDidLoad() {`

`super``.viewDidLoad()`

`}`

`override func didReceiveMemoryWarning() {`

`super``.didReceiveMemoryWarning()`

`}`

`@IBAction func cancel(sender: AnyObject) {`

`}`

`@IBAction func create(sender: AnyObject) {`

`}`

`}`

### Passo 3: Criar a interface do usuário

Abra o **Main.storyboard**  no **Project Navigator**  e arraste uma  **View Controller**  da **Object Library**  a direita. Com a view controller selecionada, abra o  **Identity Inspector**  a direita e defina  **Custume Class >**  **Class**como **AddItemViewController**.

Para adicionar uma barra de navegação na view de adicionar item, selecione a **Add Item View Controller**  e escolha  **Embed In > Navigation Controller**  no menu  **Editor**. Isto fará da  **Add Item View Controller**  a view controller raiz da navigation controller.

O próximo passo é adicionar um bar button item na barra de navegação da  **View Controller**  — não o  **Add Item View Controller**  — e defina seu  **Identifier**  para  **Add** no  **Attritutes Inspector**.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23445/image/figure-create-user-interface-1.jpg)

Quando o usuário tocar no botão  **Add**, o  **Add Item View Controller**  deve ser apresentado modalmente. Para fazer isso,  **selecione e arraste**  do botão Add para a  **Navigation Controller**, selecione  **present modally**no menu que aparece. Isto criará a segue do  **Add Item View Controller**  para a nova  **Navigation Controller**.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23445/image/figure-create-user-interface-2.jpg)

Arraste um text field e um botão do  **Object Library**  e adicione eles a cena  **Add Item View Controller**. Selecione a  **Add Item View Controller**  e conecte o outlet  `textField`  com o text field e a ação  `create:`  com o botão. A ação  `create:`  deve ser chamada quando o evento  **Touch Up Inside**  for acionado. Troque o titulo do botão para  **Create** e adicione as restrições (constraints) de layout ao text field e o botão.

![](https://cms-assets.tutsplus.com/uploads/users/41/posts/23445/image/figure-create-user-interface-3.jpg)

Para finalizar a interface do usuário, adicione um bar button item no topo esquerdo da barra de navegação do  **Add Item View Controller**  e defina seu  **Identifier**  como  **Cancel**. Com a  **Add Item View Controller**selecionada, abra o **Connections Inspector**  e conecte a ação  `cancel:`  com o botão  **Cancel**.

Compilar e executar o aplicativo pressionando  **Command-R**  para verificar que tudo está ligado corretamente.

## 2.  Implementar protocolo delegate

Quando o usuário apertar o botão  **Create**  para adicionar um novo item de tarefa, a 'add item view controller' precisa notificar a view controller. Delegação é uma solução perfeita para este cenário. O processo é muito simples.

Criamos um protocolo delegate o qual a classe  `ViewController`  se comunica. Quando a instância  `AddItemViewController`  é criada - quando o usuário aperta o botão  **Add**  - o objeto  `ViewController`  é definido como um delegate da classe  `AddItemViewController`, permitindo este ultimo a notificar a instância  `ViewController`  quando um novo item de tarefa for criado. Vamos dividir para compreender melhor este processo.

### Passo 1: Declarar o protocolo  `AddItemViewControllerDelegate`

Abra  **AddItemViewController.swift**  e declare o protocolo  `AddItemViewControllerDelegate`  abaixo das instrução de importação no topo. A declaração do protocolo é similar a declaração de uma classe. A palavra-chave  `protocol`  é seguida pelo nome do protocolo.

1

2

3

4

5

`import` `UIKit`

`protocol AddItemViewControllerDelegate {`

`func controller(controller: AddItemViewController, didAddItem: String)`

`}`

O conceito é muito similar aos protocolos em Objective-C. O nome do protocolo é  **AddItemViewControllerDelegate**  e ele define um método,  `controller(controller:,didAddItem:)`.

### Passo 2: Declarar a propriedade  `delegate`

O objeto que precisa implementar o protocolo delegate é o `AddItemViewController`. Primeiro precisamos criar uma propriedade para o delegate como mostrado no trecho baixo.

1

2

3

4

5

6

7

`class` `AddItemViewController: UIViewController {`

`@IBOutlet` `var` `textField: UITextField!`

`var` `delegate: AddItemViewControllerDelegate?`

`...`

`}`

A propriedade  `delegate`  é do tipo  `AddItemViewControllerDelegate?`, um tipo opcional, já que não temos certeza que a propriedade  `delegate`  não é igual a  `nil`. Observe que o nome do protocolo não está cercado por colchetes, como em Objective-C.

### Passo 3: Implementando ações (Actions)

O método delegate,  `controller(controller:didAddItem:)`, será chamado na ação  `create:`  como mostra abaixo. Para simplificar o exemplo, não fazemos nenhuma validação da entrada do usuário. Por segurança desempacotamos o valor armazenado na propriedade  `delegate`, o que significa que o método delegate só é chamado se a  `delegate`  for definida. O valor do campo de texto é temporariamente armazenados na constante chamada  `item`.

1

2

3

4

5

6

7

`@IBAction func create(sender: AnyObject) {`

`let` `item = self.textField.text`

`if` `let` `delegate = self.delegate {`

`delegate.controller(self, didAddItem: item)`

`}`

`}`

A implementação da ação  `cancel:`  é simples. Tudo que fizemos foi dispensar a instância de  `AddItemViewController`.

1

2

3

`@IBAction func cancel(sender: AnyObject) {`

`self.dismissViewControllerAnimated(``true``, completion: nil)`

`}`

### Passo 4: Definindo o delegate

Ainda há um pedaço do quebra-cabeça faltando. A propriedade  `delegate`  da instância  `AddItemViewController`  não está sendo definida até o momento. Podemos resolver isto implementando o método  `prepareForSegue(_:vender:)`  na classe  `ViewController`. Primeiro, entretanto, precisamos voltar ao storyboard.

Abra  **Main.storyboard**  e selecione a segue que conecta o botão  **Add**  com a  **Navigation Controller**. Abra o  **Attributes Inspector**  é defina o  **Identifier**  da segue como  **AddItemViewController**.

Em seguida, implemente o método  `prepareForSegue(_:sender:)`  na classe  `ViewController`  como mostra abaixo. Note a palavra-chave  `override`  antes do método. Isto deveria ser familiar agora.

01

02

03

04

05

06

07

08

09

10

`override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {`

`if` `segue.identifier ==` `"AddItemViewController"` `{`

`let` `navigationController = segue.destinationViewController as? UINavigationController`

`let` `addItemViewController = navigationController?.topViewController as? AddItemViewController`

`if` `let` `viewController = addItemViewController {`

`viewController.delegate = self`

`}`

`}`

`}`

Iniciamos checando o identifier da segue, certificando que estamos nós preparando para a segue correta. Perguntamos a segue por sua view controller destino. Você pode esperar que este seja a instância  `AddItemViewController`, mas lembre-se de que fizemos a view controller de view controller raiz da navigation controller. Isto significa que nós precisamos perguntar a navigation controller, a view controller destino da segue, para sua view controller superior.

A constante `AddItemViewControoler`  é do tipo  `AddItemViewController?`  por isso o uso da palavra chave  `as?`. Em outras palavras, usamos  `as?`  para fazer o downcast do valor da propriedade  `topViewController`para um tipo opcional.

Na instrução  `if`, nós desempacotamos o opcional e definimos a propriedade  `delegate`  para a instância  `ViewController`.

Tenho certeza de que você notou o uso de vários opcionais na implementação do método  `prepareForSegue(_:sender:)`. Ao interagir com APIs de Objective-C, é sempre melhor optar pela segurança. Enquanto enviar mensagens  `nil`  é perfeitamente normal em Objective-C, não é em Swift. Por causa desta diferença fundamental, você precisa sempre ter cuidado quando interagir com APIs de Objective-C em Swift. O exemplo acima ilustra bem.

### Passo 5: Implementando o protocolo  `AddItemViewControllerDelegate`

Implementar o protocolo  `AddItemViewControllerDelegate`  é parecido com a implementação do protocolo  `UITableViewDataSource`. Começamos declarando o protocolo na classe  `ViewController`, como mostrado abaixo.

1

2

3

`class` `ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {`

`...`

`}`

Em seguida, implementamos os métodos do protocolo  `AddItemViewControllerDelegate`, que se resume a implementação do método  `controller(controller:didAddItem:)`. Adicionamos o novo item para a propriedade  `items`  da view controller, recarregar a table view e dispensar a 'add view controller'.

01

02

03

04

05

06

07

08

09

10

11

`// MARK: Add Item View Controller Delegate Methods`

`func controller(controller: AddItemViewController, didAddItem: String) {`

`// Update Data Source`

`self.items.append(didAddItem)`

`// Reload Table View`

`self.tableView.reloadData()`

`// Dismiss Add Item View Controller`

`self.dismissViewControllerAnimated(``true``, completion: nil)`

`}`

### Passo 6: Compilar e rodar

Compile e rode o aplicativo para testar se você pode adicionar novos itens à lista de tarefa. Nós atualmente não validamos a entrada de dados do usuário. Como um exercício, mostre uma view de alerta ao usuário se ele apertar o botão  **Create**  e o campo de texto estiver em branco. Adicionar uma tarefa em branco não é muito útil. Certo?