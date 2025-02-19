package Model;

// O extends significa que a classe Aluno herda da classe Pessoa
public class Aluno extends Pessoa {
    // Atributos(encapsulamento)
    private String matricula;
    private String nota;

    // Métodos
    // Contrutor
    public Aluno(String nome, String cpf, String matricula) {
        super(nome, cpf);
        this.matricula = matricula;
        // O super() chama o construtor da classe pai
    }

    // Getters e Setters
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getNota() {
        return nota;
    }

    public void setNota(String nota) {
        this.nota = nota;
    }

    // Sobreescrita xibirInformações
    @Override
    public void exibirInformacoes() {
        super.exibirInformacoes();
        System.out.println("Matricula: " + matricula);
        System.out.println("Nota: " + nota);
    }

}
