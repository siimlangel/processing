String axiom = "X";
Rule[] rules;
String sentence = axiom;
float len = 300;
float angle = radians(25);
int count = 0;

void setup() {
  size(800, 800);
  rules = new Rule[2];
  rules[0] = new Rule('X', "BF+[[X]-RFX]-GF[RF]B[-FX]+X");
  rules[1] = new Rule('F', "FF");

}


void draw() {
  
  
  
  
}

void mouseClicked() {
  generate();
  
}


void generate() {
  len *= 0.5;
  String newSentence = "";
  for(int i = 0; i < sentence.length(); i++) {
    char current = sentence.charAt(i);
    boolean found = false;
    for(int j = 0; j < rules.length; j++) {
      if(current == rules[j].a) {
        found = true;
        newSentence += rules[j].b;
        break;
      }
      
    }
    if(!found){
      newSentence += current;
      
    }
    
  }
  println(sentence);
  count +=1;
  sentence = newSentence;
  
  turtle();
 
}




class Rule {
  char a;
  String b;
  Rule(char a, String b) {
    
   this.a = a;
   this.b = b;
    
  }
  
}


void turtle() {
  background(181);
  resetMatrix();
  translate(width/2, height);
  strokeWeight(3);
  for(int i = 0; i < sentence.length(); i++) {
    char current = sentence.charAt(i);
    
    if (current == 'F') {
      line(0, 0, 0, -len);
      translate(0, -len);
    } else if (current == '+') {
      rotate(angle);
    } else if (current == '-') {
      rotate(-angle);
    } else if (current == '[') {
      pushMatrix();
    } else if (current == ']') {
      popMatrix();
    } else if (current == 'B') {
      stroke(119, 171, 112);
    } else if (current == 'X') {
      stroke(75, 169, 59);      
    } else if (current == 'G') {
      stroke(91, 143, 84); 
    } else if (current == 'R') {
      stroke(85, 81, 50);
    }
      
   
    
    
  }
  
  
}
