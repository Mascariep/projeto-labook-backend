//tipagem para criação "users" com todas as colunas

export interface UserDB {
    id: string,
    name: string,
    email: string,
    password: string,
    role: string,
    created_at: string
}

// tipagem para criação POST  de "users" sem created_at
export interface UserDBPost {
    id: string,
    name: string,
    email: string,
    password: string,
    role: string
}

//----------------------------------------------------------

//tipagem para criação "posts" com todas as colunas
export interface PostDB {
    id: string,
    creator_id: string,
    content: string,
    likes: number,
    dislikes: number,
    created_at: string,
    update_at: string
}

// tipagem para criação POST de "posts" sem created_at e update_at
export interface AccountDBPost {
    id: string,
    creator_id: string,
    content: string,
    likes: number,
    dislikes: number
}

//----------------------------------------------------------

//tipagem para criação "likes_dislikes" com todas as colunas
export interface LikesDislikesDB{
    id: string,
    creator_id: string
}