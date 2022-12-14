def all_notes
  run_sql('SELECT * FROM notes ORDER BY id')
end

def create_note(date, title, note, note_type, temp_note, user_id, favourite)
  run_sql('INSERT INTO notes(date, title, note, note_type, temp_note, user_id, favourite) VALUES($1, $2, $3, $4, $5, $6, $7)', [date, title, note, note_type, temp_note, user_id, favourite])
end

def get_note(id)
  run_sql('SELECT * FROM notes WHERE id = $1', [id])[0]
end

def update_note(id, date, title, note)
  run_sql('UPDATE notes SET date = $2, title = $3, note = $4 WHERE id = $1', [id, date, title, note])
end

def delete_note(id)
  run_sql('DELETE FROM notes WHERE id = $1', [id])
end

def delete_all_temp_note
  run_sql("DELETE FROM notes WHERE temp_note = 't'")
end

def favourite_note(boolean, id)
  if boolean == 't'
  run_sql("UPDATE notes SET favourite = 't' WHERE id = $1", [id])
  else 
    run_sql("UPDATE notes SET favourite = 'f' WHERE id = $1", [id])
  end
end