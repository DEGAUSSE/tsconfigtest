// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.elsevier.tsconfig.web;

import com.elsevier.tsconfig.domain.ProviderobjectfacetEtl;
import com.elsevier.tsconfig.domain.ProviderobjectfacetEtlPK;
import com.elsevier.tsconfig.web.ProviderobjectfacetEtlController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProviderobjectfacetEtlController_Roo_Controller {
    
    private ConversionService ProviderobjectfacetEtlController.conversionService;
    
    @Autowired
    public ProviderobjectfacetEtlController.new(ConversionService conversionService) {
        super();
        this.conversionService = conversionService;
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProviderobjectfacetEtlController.create(@Valid ProviderobjectfacetEtl providerobjectfacetEtl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, providerobjectfacetEtl);
            return "providerobjectfacetetls/create";
        }
        uiModel.asMap().clear();
        providerobjectfacetEtl.persist();
        return "redirect:/providerobjectfacetetls/" + encodeUrlPathSegment(conversionService.convert(providerobjectfacetEtl.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProviderobjectfacetEtlController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ProviderobjectfacetEtl());
        return "providerobjectfacetetls/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProviderobjectfacetEtlController.show(@PathVariable("id") ProviderobjectfacetEtlPK id, Model uiModel) {
        uiModel.addAttribute("providerobjectfacetetl", ProviderobjectfacetEtl.findProviderobjectfacetEtl(id));
        uiModel.addAttribute("itemId", conversionService.convert(id, String.class));
        return "providerobjectfacetetls/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProviderobjectfacetEtlController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("providerobjectfacetetls", ProviderobjectfacetEtl.findProviderobjectfacetEtlEntries(firstResult, sizeNo));
            float nrOfPages = (float) ProviderobjectfacetEtl.countProviderobjectfacetEtls() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("providerobjectfacetetls", ProviderobjectfacetEtl.findAllProviderobjectfacetEtls());
        }
        return "providerobjectfacetetls/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProviderobjectfacetEtlController.update(@Valid ProviderobjectfacetEtl providerobjectfacetEtl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, providerobjectfacetEtl);
            return "providerobjectfacetetls/update";
        }
        uiModel.asMap().clear();
        providerobjectfacetEtl.merge();
        return "redirect:/providerobjectfacetetls/" + encodeUrlPathSegment(conversionService.convert(providerobjectfacetEtl.getId(), String.class), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProviderobjectfacetEtlController.updateForm(@PathVariable("id") ProviderobjectfacetEtlPK id, Model uiModel) {
        populateEditForm(uiModel, ProviderobjectfacetEtl.findProviderobjectfacetEtl(id));
        return "providerobjectfacetetls/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProviderobjectfacetEtlController.delete(@PathVariable("id") ProviderobjectfacetEtlPK id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProviderobjectfacetEtl providerobjectfacetEtl = ProviderobjectfacetEtl.findProviderobjectfacetEtl(id);
        providerobjectfacetEtl.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/providerobjectfacetetls";
    }
    
    void ProviderobjectfacetEtlController.populateEditForm(Model uiModel, ProviderobjectfacetEtl providerobjectfacetEtl) {
        uiModel.addAttribute("providerobjectfacetEtl", providerobjectfacetEtl);
    }
    
    String ProviderobjectfacetEtlController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
