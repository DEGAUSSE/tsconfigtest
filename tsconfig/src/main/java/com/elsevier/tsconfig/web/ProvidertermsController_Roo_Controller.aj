// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.elsevier.tsconfig.web;

import com.elsevier.tsconfig.domain.Providerconcept;
import com.elsevier.tsconfig.domain.Providerterms;
import com.elsevier.tsconfig.web.ProvidertermsController;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProvidertermsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProvidertermsController.create(@Valid Providerterms providerterms, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, providerterms);
            return "providertermses/create";
        }
        uiModel.asMap().clear();
        providerterms.persist();
        return "redirect:/providertermses/" + encodeUrlPathSegment(providerterms.getTermid().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProvidertermsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Providerterms());
        return "providertermses/create";
    }
    
    @RequestMapping(value = "/{termid}", produces = "text/html")
    public String ProvidertermsController.show(@PathVariable("termid") BigDecimal termid, Model uiModel) {
        uiModel.addAttribute("providerterms", Providerterms.findProviderterms(termid));
        uiModel.addAttribute("itemId", termid);
        return "providertermses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProvidertermsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("providertermses", Providerterms.findProvidertermsEntries(firstResult, sizeNo));
            float nrOfPages = (float) Providerterms.countProvidertermses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("providertermses", Providerterms.findAllProvidertermses());
        }
        return "providertermses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProvidertermsController.update(@Valid Providerterms providerterms, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, providerterms);
            return "providertermses/update";
        }
        uiModel.asMap().clear();
        providerterms.merge();
        return "redirect:/providertermses/" + encodeUrlPathSegment(providerterms.getTermid().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{termid}", params = "form", produces = "text/html")
    public String ProvidertermsController.updateForm(@PathVariable("termid") BigDecimal termid, Model uiModel) {
        populateEditForm(uiModel, Providerterms.findProviderterms(termid));
        return "providertermses/update";
    }
    
    @RequestMapping(value = "/{termid}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProvidertermsController.delete(@PathVariable("termid") BigDecimal termid, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Providerterms providerterms = Providerterms.findProviderterms(termid);
        providerterms.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/providertermses";
    }
    
    void ProvidertermsController.populateEditForm(Model uiModel, Providerterms providerterms) {
        uiModel.addAttribute("providerterms", providerterms);
        uiModel.addAttribute("providerconcepts", Providerconcept.findAllProviderconcepts());
    }
    
    String ProvidertermsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
