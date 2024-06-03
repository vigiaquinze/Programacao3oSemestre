package com.br.vigiaquinze.apirest_senai.Model;

import java.io.Serializable;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
public class Responsavel implements Serializable{
    @Id
    private Long id;

    private String nome;

}
