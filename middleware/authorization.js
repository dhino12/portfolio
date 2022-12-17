export function unAuth(ctx) {
    return new Promise(resolve => {
        console.log(ctx.req.cookies);
        if (Object.keys(ctx.req.cookies).length === 0) {
            return ctx.res.writeHead(302, {
                Location: '/dashboard/login'
            }).end();
        }

        return resolve('unauth')
    })
}

export function auth(ctx) {
    return new Promise(resolve => {
        if (Object.keys(ctx.req.cookies).length !== 0) {
            return ctx.res.writeHead(302, {
                Location: '/dashboard/personal'
            }).end();
        }

        return resolve('auth')
    })
}