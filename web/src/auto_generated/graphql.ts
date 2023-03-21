import gql from 'graphql-tag'
import * as Urql from '@urql/vue'
export type Maybe<T> = T | null
export type InputMaybe<T> = Maybe<T>
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] }
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> }
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> }
export type Omit<T, K extends keyof T> = Pick<T, Exclude<keyof T, K>>
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string
  String: string
  Boolean: boolean
  Int: number
  Float: number
}

export type Mutation = {
  __typename?: 'Mutation'
  /** An example field added by the generator */
  testField: Scalars['String']
}

export type Query = {
  __typename?: 'Query'
  /** Userの一覧取得 */
  ping: Scalars['String']
  /** An example field added by the generator */
  testField: Scalars['String']
}

export type PingQueryVariables = Exact<{ [key: string]: never }>

export type PingQuery = { __typename?: 'Query'; ping: string }

export const PingDocument = gql`
  query Ping {
    ping
  }
`

export function usePingQuery(
  options: Omit<Urql.UseQueryArgs<never, PingQueryVariables>, 'query'> = {}
) {
  return Urql.useQuery<PingQuery>({ query: PingDocument, ...options })
}
