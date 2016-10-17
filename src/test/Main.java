package test;

import java.io.*;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import ast.*;
import visitor.PrettyPrintVisitor;


public class Main {

	public static void main(String[] args) {
		InputStream stream;
		try {
			stream = new FileInputStream("test.txt");
			ANTLRInputStream input = new ANTLRInputStream(stream);
			miniJavaLexer lexer = new miniJavaLexer(input);
			CommonTokenStream tokens = new CommonTokenStream(lexer);
			miniJavaParser parser = new miniJavaParser(tokens);
			BuildAST builder = new BuildAST();
			Program prog = builder.visitGoal(parser.goal());
			PrettyPrintVisitor ptv = new PrettyPrintVisitor();
			prog.accept(ptv);
		
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
		  e.printStackTrace();
		}
	}

}
