# Game of Faces

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T02 <br>
**Nro do Grupo**: G5<br>
**Paradigma**: Lógico<br>

## Alunos

| Matrícula  | Aluno                                    |
| ---------- | ---------------------------------------- |
| 18/0011961 | Aline Helena Lermen                      |
| 17/0006328 | Ariel Vieira Lima Serafim                |
| 19/0056843 | Carlos Eduardo de Sousa Fiuza            |
| 17/0139981 | Danillo Gonçalves de Souza               |
| 17/0010341 | Gabriel Davi Silva Pereira               |
| 18/0122606 | Isadora da Cruz Galvão dos Santos Soares |
| 17/0069800 | Ithalo Luiz de Azevedo Mendes            |
| 17/0145514 | Iuri de Souza Severo Alves               |
| 17/0164411 | Victor Amaral Cerqueira                  |

## Sobre

O projeto _Game of Faces_ é um programa adivinho baseado no jogo Akinator e Cara a Cara. O código tem como missão adivinhar a personagem da famosa série de televisão _Game of Thrones_ que o usuário está pensando. Para isso, foi utilizado a linguagem de programação _Prolog_.
A partir das respostas que o usuário dá ao nosso programa, é possível identificar a personagem utilizando princípios do paradigma lógico vistos em sala de aula.

## Screenshots

### Personagem encontrado na base

![img1](./Assets/readme/img1.jpeg)

### Personagem não encontrado na base

![img2](./Assets/readme/img2.jpeg)

## Instalação

**Linguagens**: Prolog<br>
**Tecnologias**: SWI-Prolog<br>

1- Instalar a ferramenta [SWI-Prolog](https://www.swi-prolog.org/download/stable). Seguindo o passo a passo para sua plataforma.

2- Faça um clone do repositório

3- No terminal, vá para a pasta raíz do projeto e execute o seguinte comando:

- Input

```
swipl main.pl popula.pl utils.pl
```

- Output

```
Welcome to SWI-Prolog (threaded, 64 bits, version 8.4.2)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit https://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

```

4- Assim que os arquivos forem carregados para o _SWI-Prolog_, chame a função principal

```
?- main.
```

## Uso

Para usufruir do programa, deve-se executar todas as etapas acima. Assim que o programa tiver sido executado basta responder as perguntas do teminal com `s.` para sim ou `n.` para não. Não existe mais nenhum caso de uso.

## Vídeo

- [Apresentação](https://github.com/UnBParadigmas2021-2/2021.2_G5_Logico_Game_of_Faces/blob/master/Assets/readme/apresentacao.mp4), link para download.

## Outros

- [Prótotipo](https://www.figma.com/file/eEYsPcKrCMTnyyegUKhE6m/Paradigmal%C3%B3gico?node-id=0%3A1) para nosso prótotipo idealizado.

## Fontes

### Back

- [Akinator of Thrones](https://github.com/Paradigmas-2-2017/akinator-of-thrones)

  - Projeto similar encontrado durante desenvolvimento

- [Documentação do Prolog](https://www.swi-prolog.org/pldoc/doc_for?object=manual)

### Front

- [Server Prolog](https://github.com/da-poodle/react-and-prolog-demo)
- [Pyswip ler e escrever Prolog](https://github.com/rla/node-swipl)
