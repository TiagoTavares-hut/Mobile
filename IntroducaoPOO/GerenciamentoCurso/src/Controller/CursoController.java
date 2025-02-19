package Controller;

import Model.Aluno;
import Model.Professor;
import java.util.List;

public class CursoController {
    // Atributos
    private String nomeCurso;
    private Professor professor;
    private List<Aluno> alunosList;
    //metodos
    // Construtor
    public CursoController(String nomeCurso, Professor professor) {
        this.nomeCurso = nomeCurso;
        this.professor = professor;
    }
    //adicionarAluno (crud)
    public void adicionarAluno(Aluno aluno) {
        alunosList.add(aluno);
    }
    //exbirInformacoesCurso
    public void exbirInformacoesCurso() {
        System.out.println("Nome Curso: " + nomeCurso);
        System.out.println("Professor: "+professor.getNome());
    }

    public void exibirInformacoes() {
        System.out.println("Nome Curso: " + nomeCurso);
        System.out.println("Professor: "+professor.getNome());
        System.out.println("==========================");
        int contador = 1;
        for (Aluno aluno : alunosList) {
            contador++;
            System.out.println(contador + " . " + aluno.getNome());
            System.out.println("==========================");
        }
    }
}
