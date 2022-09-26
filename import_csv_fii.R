arquivos <- list()
i = 1
for (f in list.files('sheets')){
  temp <- paste0('sheets/', f)
  print(temp)
  arquivos[[i]] <- read.csv2(file = temp)
  
  i = i + 1
}
names(arquivos) <- list.files('sheets')

library(tidyverse)

separador <- function(padrao, arquivo = arquivos){
  procurado <- ls(arquivo, pattern = padrao)
  df <- arquivo[[ procurado[1] ]]
  for (i in 2:length(procurado)) df <- rbind(df, arquivo[[ procurado[i] ]] )  
  return(df)
}

dfin <- separador(padrao = "^dfin")
inf_anual_fii_ativo_adquirido <- separador(padrao = "^inf_anual_fii_ativo_adquirido")
inf_anual_fii_ativo_valor_contabil  <- separador(padrao = "^inf_anual_fii_ativo_valor_contabil")
inf_anual_fii_complemento  <- separador(padrao = "^inf_anual_fii_complemento")
inf_anual_fii_diretor_responsavel  <- separador(padrao = "^inf_anual_fii_diretor_responsavel")
inf_anual_fii_distribuicao_cotistas  <- separador(padrao = "^inf_anual_fii_distribuicao_cotistas")
inf_anual_fii_experiencia_profissional  <- separador(padrao = "^inf_anual_fii_experiencia_profissional")
inf_anual_fii_geral  <- separador(padrao = "^inf_anual_fii_geral")
inf_anual_fii_prestador_servico  <- separador(padrao = "^inf_anual_fii_prestador_servico")
inf_anual_fii_processo  <- separador(padrao = "^inf_anual_fii_processo_[0-9]{4}")
inf_anual_fii_processo_semelhante  <- separador(padrao = "^inf_anual_fii_processo_semelhante")
inf_anual_fii_representante_cotista  <- separador(padrao = "^inf_anual_fii_representante_cotista")
inf_anual_fii_representante_cotista_fundo  <- separador(padrao = "^inf_anual_fii_representante_cotista_fundo")
inf_mensal_fii_ativo_passivo <- separador(padrao = "^inf_mensal_fii_ativo_passivo")
inf_mensal_fii_complemento   <- separador(padrao = "^inf_mensal_fii_complemento")
inf_mensal_fii_geral         <- separador(padrao = "^inf_mensal_fii_geral")
inf_trimestral_fii_alienacao_imovel   <- separador(padrao = "^inf_trimestral_fii_alienacao_imovel")
inf_trimestral_fii_alienacao_terreno  <- separador(padrao = "^inf_trimestral_fii_alienacao_terreno")
inf_trimestral_fii_aquisicao_imovel   <- separador(padrao = "^inf_trimestral_fii_aquisicao_imovel")
inf_trimestral_fii_aquisicao_terreno  <- separador(padrao = "^inf_trimestral_fii_aquisicao_terreno")
inf_trimestral_fii_ativo    <- separador(padrao = "^inf_trimestral_fii_ativo_[0-9]{4}")
inf_trimestral_fii_ativo_garantia_rentabilidade  <- separador(padrao = "^inf_trimestral_fii_ativo_garantia_rentabilidade")
inf_trimestral_fii_complemento  <- separador(padrao = "^inf_trimestral_fii_complemento")
inf_trimestral_fii_direito  <- separador(padrao = "^inf_trimestral_fii_direito")
inf_trimestral_fii_geral    <- separador(padrao = "^inf_trimestral_fii_geral")
inf_trimestral_fii_imovel   <- separador(padrao = "^inf_trimestral_fii_imovel_[0-9]{4}")
inf_trimestral_fii_imovel_desempenho  <- separador(padrao = "^inf_trimestral_fii_imovel_desempenho")
inf_trimestral_fii_imovel_renda_acabado_contrato   <- separador(padrao = "^inf_trimestral_fii_imovel_renda_acabado_contrato")
inf_trimestral_fii_imovel_renda_acabado_inquilino  <- separador(padrao = "^inf_trimestral_fii_imovel_renda_acabado_inquilino")
inf_trimestral_fii_rentabilidade_efetiva  <- separador(padrao = "^inf_trimestral_fii_rentabilidade_efetiva")
inf_trimestral_fii_resultado_contabil_financeiro   <- separador(padrao = "^inf_trimestral_fii_resultado_contabil_financeiro")
inf_trimestral_fii_terreno  <- separador(padrao = "^inf_trimestral_fii_terreno")
