package Model;

// O abstract significa que a classe nao pode ser mexida por outras classes mas pode ser herdada
public abstract class Pessoa {
    // Atributos(encapsulamento)
    private String nome; //private, public, protected 
    private String cpf;

    //O private significa que o atributo nao pode ser acessado fora da classe
    //O public significa que o atributo pode ser acessado fora da classe
    //O protected significa que o atributo pode ser acessado fora da classe, mas nao pode ser herdado

    //O encapsulamento significa que o atributo nao pode ser acessado fora da classe
    // Métodos
    //Construtor
    public Pessoa(String nome, String cpf){
        this.nome=nome;
        this.cpf=cpf;

    }
    //getters e setters //O getters e setters sao metodos que permitem obter e alterar o valor de um atributo
    //O this significa que o atributo pertence a classe Pessoa e nao ao objeto Pessoa
    // O get pega as informacoes e o set altera as informacoes

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    //exibirInformações
    public void exibirInformacoes(){
        System.out.println("Nome: "+nome);
        System.out.println("CPF: "+cpf);
    }
}
