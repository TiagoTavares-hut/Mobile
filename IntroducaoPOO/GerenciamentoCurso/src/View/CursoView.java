package View;

import java.util.Scanner;

import Controller.CursoController;
import Model.Aluno;
import Model.Professor;

public class CursoView {
    // Atributos
    Professor jp = new Professor("João Paulo", "123.456.789-00", "R$ 1.000,00");
    CursoController cursoJava = new CursoController("Programação Java", jp);
    private int operacao;
    private boolean continuar = true;
    Scanner sc = new Scanner(System.in);

    // Métodos
    public void menu() {
        while (continuar) {
            System.out.println("==Gerenciador de Cursos==");
            System.out.println("|1 - Adicionar Aluno        |");
            System.out.println("|2 - Informações do Curso   |");
            System.out.println("|3 - Lançar Notas do alunos |");
            System.out.println("|4 - status da turma        |");
            System.out.println("|5 - Sair                   |");
            System.out.println("==Escolha um opção Desejada==");
            operacao = sc.nextInt();
            switch (operacao) {
                case 1:
                    Aluno aluno = cadastrarAluno();
                    cursoJava.adicionarAluno(aluno);
                    break;

                case 2:
                    cursoJava.exbirInformacoesCurso();
                    break;

                case 3:
                    break;

                case 4:
                    break;

                case 5:
                System.out.println("Saindo...");
                continuar = false;
                break;


                default:
                System.out.println("Informe uma opção válida");
                    break;
            }

        }
    }

    private Aluno cadastrarAluno() {
        System.out.println("Digite o Nome do aluno");
        String nome = sc.nextLine();
        System.out.println("Digite o CPF do aluno");
        String cpf = sc.next();
        System.out.println("Informe a matrícula do aluno");
        String matricula = sc.next();
        return new Aluno(nome, cpf, matricula);

    }
}