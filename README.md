# Clustering-KDD
Clustering using the K-Means algorithm and Calinski-Harabasz index, following KDD process.

Resumo: Esse projeto apresenta um estudo que teve como objetivo a identificação de perfis de alunos dos cursos de Tecnologia da Informação, de uma instituição privada, seguindo o processo KDD (*Knowledge Discovery in Databases*), realizado a partir da utilização do algoritmo K-Means na etapa de mineração de dados. O resultado atingido foi o agrupamento de 3 clusters, estabelecidos a partir da utilização do índice de Calinski-Harabasz, indicando os perfis identificados.
###### *Abstract: This project presents a study, which had the objective of observing and identifying students of Information Technology courses from a private institution, following the KDD process (Knowledge Discovery in Databases), using the K-Means algorithm in the data mining step. The result was the clustering of 3 clusters established using Calinski-Harabasz index, which indicate the indentified profiles.)*

Objetivos:
- Identificação de variáveis relevantes;
- Descrição de perfis;
- Comparação de perfis;

Tecnologias: 

<img src="images/TCC1.png" width=70px />  <img src="images/TCC2.png" width=170px />

# Descoberta de Conhecimento em Base de Dados

_Knowledge Discovery in Databases_ \- KDD

<img src="images/processo-kdd.PNG" width=550px />

## Seleção de dados:
* Dados fornecidos pela Universidade;
* 23 atributos;
* Alunos de todas asturmas, de todos os cursos;
* Período de 2012 a 2017
  * Trabalho limitado.

## Seleção dos atributos

Os atributos selecionados foram: sexo\, faixa etária\,estadodenascimento\,estadocivil\,bairro\,cidadedenascimento\,cursoUCSAL e instituição de origem\.

__Os__  __atributos descartados__  __foram__  __:__  __matrícula__  __\,__  __país__  __de__  __nascimento__  __\,__  __naturalização__  __\,__  __grupo__  __sanguíneo__  __\,__  __fator__  __RH\,__  __cor__  __\,__  __logradouro__  __\,__  __complemento__  __\,__  __imóvel__  __\,__  __apartamento__  __\, CEP\,__  __cidade__  __da instituição de origem e__  __país__  __da instituição de origem\.__

<img src="img/TCC5.png" width=81px />

<span style="color:#3F3F3F">Atributos descartados</span>

Valores não declarados

Dadosexclusivospor instância

Alto nível de _outliers_

__Figura__  __1 –__  __Valores__  __dos__  __atributos__  __descartados__

<img src="img/TCC6.png" width=500px />

Fonte: autoria própria\.

# Limpeza de dados

Apenasosalunosdoscursosdeinformáticaforamselecionados\,sendodosseguintescursos:

__Graduação__  __Superior__  __Tecnológica__  __em__  __Análise e__  __Desenvolvimento__  __de__  __Sistemas__  __;__

__Bacharelado__  __em__  __Engenharia__  __de Software;__

__Bacharelado__  __em__  __Sistemas__  __da__  __Informação__  __\.__

__Os__  __cursos__  __citados__  __foram__  __os__  __únicos__  __disponibilizados__  __na__  __base entre o__  __período__  __de 2012__  __até__  __2017\.__

<img src="img/TCC7.png" width=500px />

Osatributossexo\,estadocivil\,bairro\,cidadedenascimento\,cursoUCSAL e instituição de origempassaramportratamentode dadosinconsistentesepadronizaçãodasunidades\.

__Dados__  __inconsistentes__  __:__

Valoresausentes

Abreviaçõesinapropriadas

Errosdeortografia/gramática

Valoresemcamposinadequados

__2\.__  __Padronização__  __das__  __unidades__  __:__

Textoformatadoparamaiúsculo

Remoçãodeacentos

Remoçãodecaracteresespeciais

Concordânciadegênero

Abreviaçãoapropriada

# Descoberta de Conhecimento em Base de Dados

_Knowledge Discovery in Databases_ \- KDD

<span style="color:#595959">Fase</span>  <span style="color:#595959">de</span>  <span style="color:#595959">armazenamento</span>  <span style="color:#595959">e</span>  <span style="color:#595959">formatação</span>  <span style="color:#595959">dos dados\.</span>

<span style="color:#595959">Nessa</span>  <span style="color:#595959">etapa</span>  <span style="color:#595959">\, é</span>  <span style="color:#595959">possível</span>  <span style="color:#595959">acrescentar</span>  <span style="color:#595959">dados</span>  <span style="color:#595959">que</span>  <span style="color:#595959">sejam</span>  <span style="color:#595959">necessários</span>  <span style="color:#595959">para</span>  <span style="color:#595959">análise</span>  <span style="color:#595959">dentro</span>  <span style="color:#595959">do</span>  <span style="color:#595959">conjunto</span>  <span style="color:#595959">de dados\,</span>  <span style="color:#595959">transformando</span>  <span style="color:#595959">ou</span>  <span style="color:#595959">combinando</span>  <span style="color:#595959">de outros</span>  <span style="color:#595959">conjuntos</span>  <span style="color:#595959">\.</span>

# Transformação

__Figura__  __2 \- Pirâmide__  __Etária da População Brasileira\.__

<img src="img/TCC8.png" width=500px />

O atributo de faixa etária foi tratado da seguinte forma:

__Tabela__  __1 – Etapas do atributo faixa etária\.__

Fonte:autoria própria\.

* O atributo deinstituição de origem foi classificado da seguinte forma:
  * PRIVADA
  * PÚBLICA
  * NÃO INFORMADO

__Tabela__  __2 – Etapas do atributo instituição de origem\.__

Fonte:autoria própria\.

Acréscimode dados

Paraefetivarosresultadosdapesquisa\, fez\-senecessáriooacréscimodaclassificaçãodosbairros\,adicionandoum atributo declasse\, a partir dos dadossocioeconômicosdos 163bairrosde Salvador/BA\,cadastradospeloIBGE\.

__Figura__  __3__  __\-__ Tabela de classificação por número de salários mínimos\.

<img src="img/TCC9.png" width=500px />

# Descoberta de Conhecimento em Base de Dados

_Knowledge Discovery in Databases_ \- KDD

<span style="color:#3F3F3F">Mineração de dados</span>

<span style="color:#595959">Fase</span>  <span style="color:#595959">de</span>  <span style="color:#595959">aplicação</span>  <span style="color:#595959">de</span>  <span style="color:#595959">algoritmos</span>  <span style="color:#595959">\.</span>

<span style="color:#595959">Nessa</span>  <span style="color:#595959">etapa</span>  <span style="color:#595959">\,</span>  <span style="color:#595959">os</span>  <span style="color:#595959">dados</span>  <span style="color:#595959">são</span>  <span style="color:#595959">explorados</span>  <span style="color:#595959">com a</span>  <span style="color:#595959">utilização</span>  <span style="color:#595959">de</span>  <span style="color:#595959">algoritmos</span>  <span style="color:#595959">\,</span>  <span style="color:#595959">que</span>  <span style="color:#595959">podem</span>  <span style="color:#595959">ser</span>  <span style="color:#595959">estabelecidos</span>  <span style="color:#595959">a partir de</span>  <span style="color:#595959">técnicas</span>  <span style="color:#595959">de mineração de dados\, com</span>  <span style="color:#595959">objetivo</span>  <span style="color:#595959">de</span>  <span style="color:#595959">descobrir</span>  <span style="color:#595959">padrões</span>  <span style="color:#595959">e</span>  <span style="color:#595959">regras</span>  <span style="color:#595959">\.</span>

<span style="color:#3F3F3F">Mineração de dados</span>

AMineração de dados é um processoque exploraemodelagrandesbancosde dados\. Seu objetivo é extrair padrõesapartir de uma base de dados grande e complexa\.

<img src="img/TCC10.png" width=500px />

Técnicas utilizadas

Análise de agrupamento

Análise de Silhueta

K\-Means

Índice deCalinski\-Harabasz

<span style="color:#3F3F3F">Técnicas</span>  <span style="color:#3F3F3F">utilizadas</span>

Análise de agrupamento

Normalmente chamada de _clustering_ \, verifica relações existentes dentro de um conjunto de dados\, dividindo\-os em grupos\, analisando similaridades e discrepâncias entre elementos de um mesmo grupo ou de grupos diferentes\.

<img src="img/TCC11.png" width=500px />

<span style="color:#3F3F3F">Técnicas</span>  <span style="color:#3F3F3F">utilizadas</span>

Análise de Silhueta

Dofrancês _Silhouette_ \,determinaevalidaumnúmerode _cluster_ \,estabelecendosimilaridadesediscrepânciasentreelementos\,selecionandoomelhoralgoritmoparaserexecutadonoconjuntode dados\.Ele é calculado da seguinte forma:

O resultado do índice varia entre \-1 \(agrupamento ruim\) e 1 \(agrupamento ótimo\)\.

_HIERARCHICAL_

_K\-MEANS_

_MODEL_

_SOTA_

_CLARA_

<span style="color:#3F3F3F">Técnicas</span>  <span style="color:#3F3F3F">utilizadas</span>

Índice deCalinski\-Harabasz

Comparaasimilaridadeeisolamentodosgrupos\,avaliandoaqualidadedo _cluster_ eindicandoonúmeroessencialdegruposcom basenamaximaçãodovalorde CH\.

Figura4\- Definição do critério de _Calinski\-Harabasz_ \.

<img src="img/TCC12.png" width=187px />

O melhor número de _clusters_ para ser aplicado foi 3\.

<span style="color:#3F3F3F">Técnicas</span>  <span style="color:#3F3F3F">utilizadas</span>

O objetivo desse algoritmo é agrupar os elementos\, funcionando da seguinte forma:

Agrupam\-se os dados em K grupos\, onde K éprédefinido;

Selecionaonúmerodeponto\,aleatoriamente\,comocentrodos _clusters_ ;

Atribui\-seumamedidadedistância;

Calculaocentroide\(oumédiados dadosemcada _cluster_ \)\,agrupandooselementosaos _clusters_ quepossuíremmenordistânciaentresi;

Representaaspartiçõesdescobertas\.

<img src="img/TCC13.gif" width=500px />

Os parâmetros de entrada do _k\-_  _means_ foram: conjunto de dados\, número de gruposprédefinido \(3\)e o número de interaçãoentre oscentroides \(100\)\.

_Knowledge Discovery in Databases_ \- KDD

<span style="color:#595959">Fase</span>  <span style="color:#595959">de</span>  <span style="color:#595959">análise</span>  <span style="color:#595959">e</span>  <span style="color:#595959">interpretação</span>  <span style="color:#595959">dos dados\.</span>

<span style="color:#595959">Essa</span>  <span style="color:#595959">etapa</span>  <span style="color:#595959">estabelece</span>  <span style="color:#595959">o</span>  <span style="color:#595959">conhecimento</span>  <span style="color:#595959">gerado a partir da</span>  <span style="color:#595959">análise</span>  <span style="color:#595959">e</span>  <span style="color:#595959">interpretação</span>  <span style="color:#595959">dos</span>  <span style="color:#595959">resultados</span>  <span style="color:#595959">obtidos</span>  <span style="color:#595959">\.</span>

<span style="color:#3F3F3F">Interpretação e Análise</span>

Figura5 – Gráfico de _clusters_ por instâncias\.

<img src="img/TCC14.png" width=500px />

Fonte: autoria própria\.

<span style="color:#3F3F3F">Interpretação e Análise</span>

__Tabela 3__  __– Média dos centroides por cluster__

__Fonte: autoria própria\.__

Figura6 – Dicionário de Dados\.

<img src="img/TCC15.png" width=500px />

Fonte: autoria própria\.

<span style="color:#3F3F3F">Interpretação e Análise</span>

__Tabela__  __4__  __–__  __Perfis estabelecidos__

__Fonte: autoria própria\.__

Figura7– Gráfico deporcentagem e quantidade de alunos por grupo\.

Perfil do 1º grupo:

_Masculino_

_Idade entre 25 a 29 anos_

_Nascido em Salvador/BA_

_Casado_

_Estudou em instituição pública_

_Residente de bairro classe E_

Perfil do 2º grupo:

_Masculino_

_Idade entre 20 a 24 anos_

_Nascido em Salvador/BA_

_Solteiro_

_Estudou em instituição privada_

_Residente de bairro cuja classe não foi informada_

Perfil do 3º grupo:

_Masculino_

_Idade entre 20 a 24 anos_

_Nascido em Salvador/BA_

_Solteiro_

_Estudou em instituição privada_

_Residente de bairro classe E_

Fonte: autoria própria\.

Figura __7__ – Gráfico deporcentagem e quantidade de alunos por grupo\.

Fonte: autoria própria\.

Figura8– Gráfico deporcentagem e quantidade de alunos por grupo\.

Perfil do 2º e 3º grupo:

_Masculino_

_Idade entre 20 a 24 anos_

_Nascido em Salvador/BA_

_Solteiro_

_Estudou em instituição privada_

Fonte: autoria própria\.

Figura9– Gráfico deresidentes de bairro classe E\.

Fonte: autoria própria\.

