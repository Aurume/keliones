package travel;

import javax.persistence.*;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity // This tells Hibernate to make a table out of this class
public class Klientai {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;

    private String vardas;

    private String pavarde;
    
    private Integer flag_poilsine;    
    
    private Integer flag_pazintine;
    
    private Integer flag_viskas_iskaiciuota;
    
    private Integer flag_laisvai_pasirenkama;
    
    // @OneToMany(mappedBy = "patiekalai",cascade = CascadeType.ALL)
    @JsonIgnoreProperties("klientai") 
    @OneToMany(mappedBy = "klientai",cascade = CascadeType.ALL)
    private List<Klientu_keliones> klientu_keliones; 
    
	public Klientai() {
    	
	}
	
	public Klientai(String vardas, String pavarde, Integer flag_poilsine, Integer flag_pazintine, 
			Integer flag_viskas_iskaiciuota, Integer flag_laisvai_pasirenkama ) {
    	
    	this.vardas = vardas;
    	this.pavarde = pavarde;
    	this.flag_poilsine = flag_poilsine;
    	this.flag_pazintine = flag_pazintine;
    	this.flag_viskas_iskaiciuota = flag_viskas_iskaiciuota;
    	this.flag_laisvai_pasirenkama = flag_laisvai_pasirenkama;
   }
    

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVardas() {
		return vardas;
	}

	public void setVardas(String vardas) {
		this.vardas = vardas;
	}

	public String getPavarde() {
		return pavarde;
	}

	public void setPavarde(String pavarde) {
		this.pavarde = pavarde;
	}

	public Integer getFlag_poilsine() {
		return flag_poilsine;
	}

	public void setFlag_poilsine(Integer flag_poilsine) {
		this.flag_poilsine = flag_poilsine;
	}	
	
	public Integer getFlag_pazintine() {
		return flag_pazintine;
	}

	public void setFlag_pazintine(Integer flag_pazintine) {
		this.flag_pazintine = flag_pazintine;
	}
	
	public Integer getFlag_viskas_iskaiciuota() {
		return flag_viskas_iskaiciuota;
	}

	public void setFlag_viskas_iskaiciuota(Integer flag_viskas_iskaiciuota) {
		this.flag_viskas_iskaiciuota = flag_viskas_iskaiciuota;
	}
	
	public void setFlag_laisvai_pasirenkama(Integer flag_laisvai_pasirenkama) {
		this.flag_laisvai_pasirenkama = flag_laisvai_pasirenkama;
	}
	
	public List<Klientu_keliones> getKlientu_keliones() {
		
		return klientu_keliones;
	}
	public void setKlientu_keliones (List<Klientu_keliones> Klientu_keliones) {
		
		this.klientu_keliones = Klientu_keliones;
	}		
	
	public String toString() {
		
	    return this.id + " / " + this.vardas + " / " + this.pavarde + " / " + this.flag_pazintine + " / " + this.flag_poilsine + " / " + this.flag_viskas_iskaiciuota + this.flag_laisvai_pasirenkama;
	    		
	}
	
}
