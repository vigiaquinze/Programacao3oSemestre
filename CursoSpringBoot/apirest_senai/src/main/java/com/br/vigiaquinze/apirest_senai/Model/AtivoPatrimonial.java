package com.br.vigiaquinze.apirest_senai.Model;
import java.io.Serializable;

import jakarta.persistence.*;
import lombok.*;

public class AtivoPatrimonial implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String nome;

    @ManyToOne
    @JoinColumn(name = "ambiente_id", nullable = false)
    private Ambiente ambiente;

    //getters and setters
}
