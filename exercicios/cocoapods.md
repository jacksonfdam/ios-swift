
# CocoaPods: Gerenciando bibliotecas no XCode

O desenvolvimento de aplicativos iOS já é algo mais que consolidado nos dias atuais, então é muito fácil encontrar inúmeras bibliotecas espalhadas pela internet, as quais poupam o desenvolvedor de implementar funcionalidades já comumente usadas. Se você considera bastante tedioso procurar as bibliotecas, baixá-las, adicioná-las no diretório do projeto, ligá-las ao projeto no Xcode, e repetir esses passos sempre que quiser adicionar outras bibliotecas ou atualizar as que já estão no projeto, perceberá neste artigo como esse trabalho pode ser facilitado.

A partir de agora não será necessário baixar código no GitHub e copiá-lo no seu projeto (e, eventualmente, repetir o processo quando precisar atualizar o código). O CocoaPods fará isso por você automaticamente. Se você criou alguma biblioteca em Objective-C ou Swift (tanto para iOS como para Mac) e acha interessante compartilhar com a comunidade de desenvolvedores, considere a ideia de dar suporte ao CocoaPods.

Para realizar esse gerenciamento, o CocoaPods utiliza um arquivo, chamado Podfile, que lista todas as dependências e as informações necessárias que a ferramenta precisa para baixar, atualizar, remover, saber qual versão utilizar, dentre outras necessidades.

### Montando o ambiente

É importante notar que o CocoaPods roda em Ruby. Sendo assim, a primeira coisa a ser feita é atualizar as RubyGems de sua máquina com o seguinte comando no terminal:

```shell
$ sudo gem update –system
````

Além disto, certifique-se de que está instalado o Command Line Tools no Xcode. Caso não esteja, basta ir a  _Xcode > Preferences > Downloads > Components_  e escolha  _Command Line Tools_, clicando em instalar ou atualizar. Se já estiver instalado, este passo pode ser pulado. Veja na  **Figura 1** a tela  _Components_, onde aparece o Command Line Tools.

![](http://arquivo.devmedia.com.br/REVISTAS/mobile/imagens/54/4/1.png)

**Figura 1.**  Xcode > Preferences > Downloads > Components

### Instalação

Tendo os pré-requisitos necessários instalados, vamos à instalação do CocoaPods. Basta digitar essa linha no terminal:

```shell
$ [sudo] gem install cocoapods
````
Vale lembrar que o comando acima também é válido para atualizar a instalação atual do CocoaPods. Para configurar o ambiente e finalizar a instalação, digite o seguinte comando:

```shell
$ pod setup
```
Em poucos passos, temos a ferramenta instalada. Note que não só a instalação, mas também a utilização da ferramenta é extremamente simples e fácil. O intuito do CocoaPods é simplificar a vida do desenvolvedor do início ao fim, e de fato executa bem o seu papel.

### Criando um projeto para utilizar o CocoaPods

Agora que o  `CocoaPods`  está instalado crie um novo projeto no  `Xcode`.

Navegue até a pasta raiz do projeto e digite o comando  `pod init`  para criar o arquivo  `Podfile`  onde ficam armazenados os dados dos projetos adicionados.

Nele a primeira definição é sobre para qual plataforma o projeto está sendo desenvolvido.

`platform` `:ios``,` `'7.0'`

A partir disso é declarar as bibliotecas a serem usadas e definir a versão com a declaração  **pod**  que o projeto usa:

`platform` `:ios``,` `'7.0'`

`pod` `'AFNetworking'``,` `'~> 2.2.0'`

Os operadores que podem ser especificados junto com uma dependência são: **>, >=, <, <=** e **~>.**  

No Podfile anterior, o operador  **~>**  diz que qualquer versão que mantenha o MAJOR e o MINOR pode ser usado, ou seja, 2.2.0 e 2.2.1 (já que só muda o PATCH) seriam aceitos mas 2.3.0 ou qualquer acima dela não. Para mais detalhes sobre a semântica do versionamento acesse  [http://semver.org/](http://semver.org/).

Depois da definição das dependências um comando é usado para a download e instalação:

`pod install`

### Instalando um pod

Vamos utilizar a biblioteca  [DeviceKit](https://github.com/dennisweissmann/DeviceKit)  no nosso tutorial. Esta biblioteca nos da uma informação detalhada de qual device estamos rodando o nosso aplicativo e é um substituto do `UIDevice`do  `UIKit`.

Você pode pesquisar os  `pods`  disponíveis no site [cocoapods.org](https://cocoapods.org/). No site é possível pesquisar filtrando pelo tipo de dispositivo e a linguagem utilizada conforme o print abaixo.

![DeviceKit on cocoa pods.org](https://mateusfsilvablog.files.wordpress.com/2017/03/devicekit-on-cocoa-pods-org.png?w=1024&h=481)

Consultando pelo nome  `DeviceKit`  encontramos o  `pod`  desejado disponível na versão  `0.3.1`. Abra o arquivo  `Podfile`  em um editor de texto e adicione a Biblioteca  `DeviceKit`conforme o exemplo abaixo.

```ruby
# Uncomment this line to define a global platform for your project
platform :ios, '9.0'
# Uncomment this line if you're using Swift
use_frameworks!

target 'TutorialCocoaPods' do
  pod 'DeviceKit', '~> 0.3.1'
end
```

Observe que o comentário da linha  `platform :ios, '9.0'`  foi excluido e desta forma definimos que a plataforma utilizada será o  `iOS`  versão  `9.0`.  
Como estou utilizando a linguagem Swift também exclui o comentário da linha “use_frameworks!”.

No arquivo  `Podfile`  devemos definir os  `pods`  que iremos instalar dentro de um bloco que será criado para cada projeto. Exemplo:

```ruby
target 'MeuProjeto'  do
  pod 'Pod1', '~> x.x'
  pod 'Pod2', '~> x.x.x'
end
```

Salve o arquivo  `Podfile`  e digite o comando  `pod install` no diretório raiz do projeto para baixar os pacotes desejados.

Caso algum  `pod`  adicionado tenha um outro  `pod`  como dependência este também será instalado.  
O gerenciamento dos  `pods`  que já foram instalados é feito através do arquivo `Podfile.lock`.

```ruby
PODS:
  - DeviceKit (0.3.1)

DEPENDENCIES:
  - DeviceKit (~> 0.3.1)

SPEC CHECKSUMS:
  DeviceKit: eb8909d941cee4dc7f6cc5b1b40a41da523a197d

PODFILE CHECKSUM: bdd969b20450f88374e0fe9d62207a016d4a961a

COCOAPODS: 1.0.0.beta.2

```

Sempre que o comando  `pod install`  é executado o  `CocoaPods`  irá verificar quais  `pods`estão no arquivo  `Podfile`  mas que ainda não estão no arquivo  `Podfile.lock`  e irá baixa-los dos respectivos repositórios. Caso o  `pod`  conste no  `Podfile.lock`  mas não esteja no diretório  `pods`, ele será baixado na versão específica que estiver no  `Podfile.lock`. Então, é interessante que você acrescente estes dois arquivos ao controle de versão para que todos os integrantes da equipe que forem utilizar o projeto instalem as mesmas versões dos  `pods`.

O comando  `pod update`  irá atualizar todos os  `pods`  instalados anteriormente para a versão mais recente disponível no [specs](https://github.com/CocoaPods/Specs) do  `CocoaPods`.  **Cuidado**  com este comando pois ele pode quebrar a compilação do seu projeto dependendo da alteração realizada no pacote.

O comando  `pod install`  irá realizar as seguintes tarefas no seu projeto.

No  `Xcode`, através do  [fonte ruby](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer/user_project_integrator.rb#L61-L65):

1.  Criará ou atualizará o [workspace](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer/user_project_integrator.rb#L82).
2.  [Adicionará o seu projeto ao workspace](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer/user_project_integrator.rb#L88-L94) se necessário.
3.  Adicionará o [projeto da biblioteca statica do CocoaPods ao workspace](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer/target_installer.rb#L40-L61) se necessário.
4.  Adicionará libPods.a a: [targets => build phases => link with libraries](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer.rb#L385-L393).
5.  Adicionará o CocoaPods [arquivo de configuração do Xcode](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer/user_project_integrator/target_integrator.rb#L112) ao projeto do seu aplicativo.
6.  Alterará o [target configurations](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/generator/xcconfig/aggregate_xcconfig.rb#L46-L73) do seu aplicativo para ser baseado no CocoaPods.
7.  Adicionará à faze de build [para copiar os recursos de todos os pods](https://github.com/CocoaPods/CocoaPods/blob/master/lib/cocoapods/installer/user_project_integrator/target_integrator.rb#L145)  que você adicionou ao seu projeto, ou seja, uma ‘Script build phase’ após todas as outras fases de build com o seguinte:
    -   Shell: `/bin/sh`
    -   Script: `${SRCROOT}/Pods/PodsResources.sh`

Feche o projeto criado anteriormente e abra o  `workspace`  criado pelo  `CocoaPods`.

Note que além dos arquivos  `Podfile`  e  `Podfile.lock`  foi criado um  `workspace`(.xcworspace) do projeto. Utilizaremos este arquivo para abrir o projeto a partir de agora.

Na pasta  `Pods`  ficam todos os  `pods`  adicionados no  `Podfile`.
