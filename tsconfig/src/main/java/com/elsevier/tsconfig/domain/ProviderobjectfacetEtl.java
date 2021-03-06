package com.elsevier.tsconfig.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = ProviderobjectfacetEtlPK.class, versionField = "", table = "PROVIDEROBJECTFACET_ETL", schema = "TS_CLIENT")
@RooDbManaged(automaticallyDelete = true)
public class ProviderobjectfacetEtl {
}
