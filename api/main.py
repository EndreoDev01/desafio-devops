from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from pydantic import BaseModel
from typing import List
import models
from database import SessionLocal, engine, Base

# Cria as tabelas no banco, se ainda não existirem
Base.metadata.create_all(bind=engine)

app = FastAPI()

# Conexão com o banco em cada requisição
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

class CommentCreate(BaseModel):
    email: str
    comment: str
    content_id: int

class CommentOut(BaseModel):
    id: int
    email: str
    comment: str
    content_id: int

    class Config:
        orm_mode = True

@app.post("/api/comment/new", response_model=CommentOut)
def create_comment(comment: CommentCreate, db: Session = Depends(get_db)):
    db_comment = models.Comment(**comment.dict())
    db.add(db_comment)
    db.commit()
    db.refresh(db_comment)
    return db_comment

@app.get("/api/comment/list/{content_id}", response_model=List[CommentOut])
def list_comments(content_id: int, db: Session = Depends(get_db)):
    return db.query(models.Comment).filter(models.Comment.content_id == content_id).all()
