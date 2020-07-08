#include <cstdlib>
#include <cmath>
#include <iostream>
#include <string>
#include <map>
#include <valarray>

#include "mewlib/mewmewLexer.h"
#include "mewlib/mewmewParser.h"
#include "mewlib/mewmewBaseVisitor.h"

using namespace std;
using namespace antlr4;
using namespace antlrcpp;

map<string, int> _vartable;


int mew_to_int(string m){

    int n = m.size()/3;

    return n;

}

class MewMewEval : public mewmewBaseVisitor{

public:
    antlrcpp::Any visitAssignExpr(mewmewParser::AssignExprContext *ctx) override{

            string id = ctx->ID()->toString();
            int value = visit(ctx->expr());

            if (_vartable.count(id)){
                _vartable[id] = value;
            }else{
                _vartable.insert(pair<string , int>(id , value));
            }
            return 0;
    }

    antlrcpp::Any visitPrintExpr(mewmewParser::PrintExprContext *ctx) override{
        
        int ex = visit(ctx->expr());
        cout << ex << endl;
        return 0;

    }

   antlrcpp::Any visitAbsExpr(mewmewParser::AbsExprContext *ctx) override{

        int expr = visit(ctx->expr());
        return abs(expr);

   } 

   antlrcpp::Any visitUnaryExpr(mewmewParser::UnaryExprContext *ctx) override{
        
       int exp = visit(ctx->expr());
       return -exp;

   }  

   antlrcpp::Any visitModExpr(mewmewParser::ModExprContext *ctx) override{
        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        return left % right;

   }
    antlrcpp::Any visitAddSubExpr(mewmewParser::AddSubExprContext *ctx) override{
        
        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        
        if (ctx->op->getType() == mewmewParser::ADD){
            
            return left + right;


        }else{
            
            return left - right;

        }

    }

    antlrcpp::Any visitMulDivExpr(mewmewParser::MulDivExprContext *ctx) override{
        
        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));

        if (ctx->op->getType() == mewmewParser::MUL){
                
            return left * right;
            
        }else{
            return left / right;
        }

    }

    antlrcpp::Any visitPowExpr(mewmewParser::PowExprContext *ctx) override{
        
        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        
        return pow(left , right);

    }

    antlrcpp::Any visitEqExpr(mewmewParser::EqExprContext *ctx) override{

        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        int result = left == right;

        return result;

    }

    antlrcpp::Any visitGeExpr(mewmewParser::GeExprContext *ctx) override{
         int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        int result = left >= right;

        return result;

    }

    antlrcpp::Any visitGtExpr(mewmewParser::GtExprContext *ctx) override{
        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        int result = left > right;
    
        return result;
    }

    antlrcpp::Any visitLeExpr(mewmewParser::LeExprContext *ctx) override{
     int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        int result = left <= right;

        return result;

    }

    antlrcpp::Any visitLtExpr(mewmewParser::LtExprContext *ctx) override{
        int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        int result = left < right;

        return result;

    }
    
    antlrcpp::Any visitNeExpr(mewmewParser::NeExprContext *ctx) override{
    int left = visit(ctx->expr(0));
        int right = visit(ctx->expr(1));
        int result = left != right;

        return result;

    }

    antlrcpp::Any visitIdExpr(mewmewParser::IdExprContext *ctx) override {

          string id = ctx->ID()->toString();
          if(_vartable.count(id) == 1){
            return _vartable[id];
          }else{
            cerr << endl << "/ᐠ–ꞈ–ᐟ\\ Undeclared Variable '" << id << "'" << endl;
            exit(1);
          }
        }

    antlrcpp::Any visitNumExpr(mewmewParser::NumExprContext *ctx) override{
        
        string m_ = ctx->NUM()->toString();
        int x = mew_to_int(m_);
        return x;

    }

    antlrcpp::Any visitIfExpr(mewmewParser::IfExprContext *ctx) override{
        
        int cond = visit(ctx->expr());
        if (cond == 1){
            visit(ctx->stmts());
        }
        return cond;

    }

    antlrcpp::Any visitIfElseExpr(mewmewParser::IfElseExprContext *ctx) override{
       int cond = visit(ctx->expr());
       /* cout << "=>" << cond << endl; */
       if (cond == 1) {
            visit(ctx->stmts(0));
       }else{
            visit(ctx->stmts(1));
       }
       return cond;

    }

    antlrcpp::Any visitRepeatExpr(mewmewParser::RepeatExprContext *ctx) override{
    
       int con = visit(ctx->expr());
       /* cout << "=>" << con << endl; */
       for (int i = 1 ; i <= con ; ++i){
        visit(ctx->stmts());
        
       }
       return con;

    }

};



void parse(ANTLRFileStream input){

    
    mewmewLexer lexer(&input);
    CommonTokenStream tokens(&lexer);
    tokens.fill();
    mewmewParser parser(&tokens);
    tree::ParseTree* tree = parser.prog();
    MewMewEval* mv = new MewMewEval();
    mv->visit(tree);
    
}

int main(int argc, char **argv) {

  if (argc < 2) {
    cout << endl << u8"/ᐠ｡ꞈ｡ᐟ\\ MewMew - Program in Cats' Language!" << endl << endl;
    cout << "No Specified filename to execute :(" << endl;
    cerr << "Usage: ./mewmew FILENAME" << endl;
  } else if (argc == 2) {

    ANTLRFileStream filename(argv[1]);
    parse(filename);
  }
  return 0;
}
