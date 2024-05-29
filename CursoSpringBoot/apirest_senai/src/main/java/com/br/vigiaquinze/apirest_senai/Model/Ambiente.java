package com.br.vigiaquinze.apirest_senai.Model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
public class Ambiente implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String nome;

    @OneToMany(mappedBy = "ambiente")
    private List<AtivoPatrimonial> ativo;

    @OneToOne
    @JoinColumn(name = "responsavel_id", nullable = false)
    private Responsavel responsavel;
}
